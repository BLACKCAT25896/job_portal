import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/sms/sent_sms/domain/model/user_list_for_sms_model.dart';
import 'package:mighty_job/feature/sms/sent_sms/logic/sent_sms_controller.dart';
import 'package:mighty_job/feature/sms/sent_sms/presentation/widgets/select_user_type_sms.dart';
import 'package:mighty_job/feature/sms/sent_sms/presentation/widgets/sent_new_sms_widget.dart';
import 'package:mighty_job/feature/sms/sent_sms/presentation/widgets/sms_user_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class UserListForSmsWidget extends StatelessWidget {
  final ScrollController scrollController;
  final bool showRouteSection;
  const UserListForSmsWidget({super.key, required this.scrollController,
     this.showRouteSection = true});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SentSmsController>(
      initState: (state) => Get.find<SentSmsController>().getUserListFoeSms("Student"),
      builder: (controller) {
        final sentSmsModel = controller.userListForSmsModel;
        final user = sentSmsModel?.data ?? [];

        return GenericListSection<UserItemForSms>(
          showRouteSection: showRouteSection,
          sectionTitle: "sms_management".tr,
          addNewTitle: "send_sms".tr,
          onAddNewTap: (){
            Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)),
                child: const SentNewSmsWidget()));
          },
          topWidget: const SizedBox(width: 120,child: SelectUserTypeSms()),
          pathItems: ["user_list".tr],
          headings: const ["name", "phone", "user_type", ],
          scrollController: scrollController,
          isLoading: sentSmsModel == null,
          totalSize:  0,
          offset:  0,
          onPaginate: (offset) async => await controller.getUserListFoeSms("Student"),
          items: user,
          itemBuilder: (item, index) => SmsUserItemWidget(index: index, userItem: item),
        );
      },
    );
  }
}
