import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/leave_type/controller/leave_type_controller.dart';
import 'package:mighty_job/feature/human_resource/leave_type/domain/models/leave_type_model.dart';
import 'package:mighty_job/feature/human_resource/leave_type/presentation/screens/create_new_leave_type_screen.dart';
import 'package:mighty_job/feature/human_resource/leave_type/presentation/widgets/leave_type_item_widget.dart';

class LeaveTypeListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LeaveTypeListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveTypeController>(
      initState: (val) => Get.find<LeaveTypeController>().getLeaveTypeList(1),
      builder: (leaveTypeController) {
        final leaveTypeModel = leaveTypeController.leaveTypeModel;
        final leaveTypeData = leaveTypeModel?.data;

        return GenericListSection<LeaveTypeItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["leave_type_list".tr],
          addNewTitle: "add_new_leave_type".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "leave_type".tr,
              child: const CreateNewLeaveTypeScreen())),
          headings: const ["name", "maxDays","isPaid", "carryForward", "status"],

          scrollController: scrollController,
          isLoading: leaveTypeModel == null,
          totalSize: leaveTypeData?.total ?? 0,
          offset: leaveTypeData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await leaveTypeController.getLeaveTypeList(offset ?? 1),

          items: leaveTypeData?.data ?? [],
          itemBuilder: (item, index) => LeaveTypeItemWidget(
            index: index,
            leaveTypeItem: item,
          ),
        );
      },
    );
  }
}