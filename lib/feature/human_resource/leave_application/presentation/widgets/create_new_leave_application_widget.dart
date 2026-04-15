import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/leave_application/controller/leave_application_controller.dart';
import 'package:mighty_job/feature/human_resource/leave_application/domain/models/leave_application_body.dart';
import 'package:mighty_job/feature/human_resource/leave_application/domain/models/leave_application_model.dart';
import 'package:mighty_job/feature/human_resource/leave_application/presentation/widgets/select_leave_duration_widget.dart';
import 'package:mighty_job/feature/human_resource/leave_type/controller/leave_type_controller.dart';
import 'package:mighty_job/feature/human_resource/leave_type/presentation/widgets/leave_type_selection_widget.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewLeaveApplicationWidget extends StatefulWidget {
  final LeaveApplicationItem? leaveApplicationItem;
  const CreateNewLeaveApplicationWidget({super.key, this.leaveApplicationItem});

  @override
  State<CreateNewLeaveApplicationWidget> createState() => _CreateNewLeaveApplicationWidgetState();
}

class _CreateNewLeaveApplicationWidgetState extends State<CreateNewLeaveApplicationWidget> {
  TextEditingController reasonController = TextEditingController();
  TextEditingController adminNoteController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.leaveApplicationItem != null){
      update = true;


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveApplicationController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


        ResponsiveMasonryGrid(children: [

         SelectLeaveTypeWidget(),
          DateSelectionWidget(title: "start_date".tr),

          ExpiryDateSelectionWidget(title: "end_date".tr),
          SelectLeaveDurationWidget(),


          CustomTextField(title: "reason".tr,
            controller: reasonController,
            hintText: "reason".tr,),

          CustomTextField(title: "admin_note".tr,
            controller: adminNoteController,
            hintText: "admin_note".tr,),

        ]),



        controller.isLoading? const Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              int? userId = Get.find<ProfileController>().profileModel?.data?.id;
              String? leaveTypeId = Get.find<LeaveTypeController>().selectedLeaveTypeItem?.id;
              String reason = reasonController.text.trim();
              String adminNote = adminNoteController.text.trim();
              String startDate = Get.find<DatePickerController>().formatedFromDate;
              String endDate = Get.find<DatePickerController>().formatedToDate;
              String duration = controller.selectedDurationType;



              if(reason.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }else if(leaveTypeId== null){
                showCustomSnackBar("select_eave_type".tr);
              }
              else{
                LeaveApplicationBody body = LeaveApplicationBody(
                  status: "pending",
                  employeeId: userId,
                  leaveTypeId: int.parse(leaveTypeId),
                  startDate: startDate,
                  endDate: endDate,
                  reason: reason,
                  leaveDurationType: duration,
                  adminNote: adminNote,
                    method: update? "put" : "post"
                );
                if(update){
                  controller.updateLeaveApplication(body, int.parse(widget.leaveApplicationItem!.id!));
                }else{
                  controller.createNewLeaveApplication(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
