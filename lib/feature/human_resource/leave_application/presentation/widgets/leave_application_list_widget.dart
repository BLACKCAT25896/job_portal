import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/leave_application/presentation/widgets/create_new_leave_application_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/leave_application/controller/leave_application_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_application/domain/models/leave_application_model.dart';
import 'package:ecommerce/feature/human_resource/leave_application/presentation/widgets/leave_application_item_widget.dart';

class LeaveApplicationListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LeaveApplicationListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveApplicationController>(
      initState: (val) => Get.find<LeaveApplicationController>().getLeaveApplicationList(1),
      builder: (leaveApplicationController) {
        final leaveApplicationModel = leaveApplicationController.leaveApplicationModel;
        final leaveApplicationData = leaveApplicationModel?.data;

        return GenericListSection<LeaveApplicationItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["leave_application".tr],
          addNewTitle: "add_new_leave_application".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "leave_application".tr,
              child: const CreateNewLeaveApplicationWidget())),
          headings: const ["name","reason", "type","start_date","end_date","duration_type", "leave_status","note"],

          scrollController: scrollController,
          isLoading: leaveApplicationModel == null,
          totalSize: leaveApplicationData?.total ?? 0,
          offset: leaveApplicationData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await leaveApplicationController.getLeaveApplicationList(offset ?? 1),

          items: leaveApplicationData?.data ?? [],
          itemBuilder: (item, index) => LeaveApplicationItemWidget(index: index, leaveApplicationItem: item),
        );
      },
    );
  }
}