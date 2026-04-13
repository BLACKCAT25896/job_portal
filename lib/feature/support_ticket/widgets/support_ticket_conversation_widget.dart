import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/paginated_list_widget.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/no_data_found.dart';
import 'package:ecommerce/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:ecommerce/feature/support_ticket/domain/models/support_reply_model.dart';
import 'package:ecommerce/feature/support_ticket/widgets/support_ticket_reply_widget.dart';
import 'package:ecommerce/helper/date_converter.dart';

class SupportTicketConversationWidget extends StatefulWidget {
  final String id;
  final ScrollController scrollController;
  const SupportTicketConversationWidget({super.key, required this.scrollController, required this.id});

  @override
  State<SupportTicketConversationWidget> createState() => _SupportTicketConversationWidgetState();
}

class _SupportTicketConversationWidgetState extends State<SupportTicketConversationWidget> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.scrollController.hasClients) {
        widget.scrollController.jumpTo(widget.scrollController.position.minScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    // Important: Do not dispose widget.scrollController if it's passed from parent
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(
        builder: (supportController) {
          ApiResponse<ReplyItem>? replyModel = supportController.supportReplyModel;
          List<ReplyItem>? replyItem = replyModel?.data?.data;

          return replyModel != null ? (replyItem != null && replyItem.isNotEmpty) ?
          PaginatedListWidget(
            onPaginate: (int? page) async => supportController.getReplyList(widget.id, page??1),
            scrollController: widget.scrollController,
            offset: replyModel.data?.currentPage??1,
            totalSize: replyModel.data?.total??0,
            itemView: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: replyItem.length,
                itemBuilder: (context, index) {
                  ReplyItem comment = replyItem[index];
                  bool isMe = (comment.userId != Get.find<ProfileController>().profileModel?.data?.id);
                  String? message = comment.message;
                  String dateTime = DateConverter.supportDate(comment.createdAt!);
                  return SupportTicketReplyWidget(message: message, dateTime: dateTime, isMe: isMe);
                },),
          ) :const NoDataFound(): const Center(child: CircularProgressIndicator());
        }
    );
  }
}
