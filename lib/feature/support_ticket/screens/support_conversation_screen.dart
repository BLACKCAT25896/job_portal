import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/feature/support_ticket/widgets/support_ticket_conversation_widget.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SupportConversationScreen extends StatefulWidget {
  final String ticketId;
  const SupportConversationScreen({super.key, required this.ticketId, });
  @override
  State<SupportConversationScreen> createState() => _SupportConversationScreenState();
}
class _SupportConversationScreenState extends State<SupportConversationScreen> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<SupportTicketController>().getReplyList(widget.ticketId.toString(), 1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "chatting".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: SupportTicketConversationWidget(
          scrollController: scrollController, id: widget.ticketId.toString(),))]
      ),
      bottomNavigationBar:  GetBuilder<SupportTicketController>(
        builder: (supportController) {
          return SizedBox(height: 70,
            child: Card(color: Theme.of(context).cardColor,
              elevation: 2,
              margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Padding(padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall),
                child: Row(children: [
                  Expanded(child: TextField(
                      controller: messageController,
                      style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 1,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Type here...',
                        hintStyle: textRegular.copyWith(color: Theme.of(context).hintColor),
                        border: InputBorder.none,
                      ))),

                  supportController.isReplyLoading? CircularProgressIndicator():
                  InkWell(onTap: () {
                    if(messageController.text.isNotEmpty){
                      supportController.replyTicket(widget.ticketId, messageController.text);
                      messageController.text = '';
                    }
                  }, splashColor: Colors.transparent, highlightColor: Colors.transparent,
                    child: Icon(Icons.send, color: systemPrimaryColor(),
                      size: Dimensions.iconSizeDefault,),
                  ),
                ]),
              ),
            ),
          );
        }
      ),
    );
  }
}
