import 'package:ecommerce/common/widget/custom_checkbox.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/human_resource/leave_type/domain/models/leave_type_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/human_resource/leave_type/controller/leave_type_controller.dart';
import 'package:ecommerce/feature/human_resource/leave_type/domain/models/leave_type_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewLeaveTypeScreen extends StatefulWidget {
  final LeaveTypeItem? leaveTypeItem;
  const CreateNewLeaveTypeScreen({super.key, this.leaveTypeItem});

  @override
  State<CreateNewLeaveTypeScreen> createState() => _CreateNewLeaveTypeScreenState();
}

class _CreateNewLeaveTypeScreenState extends State<CreateNewLeaveTypeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController maxDaysController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.leaveTypeItem != null){
      final leaveTypeController = Get.find<LeaveTypeController>();
      update = true;
      nameController.text = widget.leaveTypeItem?.name??'';
      maxDaysController.text = widget.leaveTypeItem?.maxDays.toString()??'';
      descriptionController.text = widget.leaveTypeItem?.description??'';
      leaveTypeController.toggleIsPaid(widget.leaveTypeItem?.isPaid == "1", notify: false);
      leaveTypeController.toggleCarryForward(widget.leaveTypeItem?.carryForward == "1", notify: false);

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveTypeController>(builder: (leaveTypeController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [


          ResponsiveMasonryGrid(children: [
            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),

            CustomTextField(title: "max_days".tr,
            controller: maxDaysController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "max_days".tr,),

            CustomTextField(title: "description".tr,
            controller: descriptionController,
            hintText: "enter_description".tr,),

            CustomCheckbox(value: leaveTypeController.isPaid, title: "is_paid".tr,
            onChange: ()=> leaveTypeController.toggleIsPaid(!leaveTypeController.isPaid)),

            CustomCheckbox(value: leaveTypeController.carryForward, title: "carry_forward".tr,
            onChange: ()=> leaveTypeController.toggleCarryForward(!leaveTypeController.carryForward)),

          ]),



          leaveTypeController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String name = nameController.text.trim();
              String maxDays = maxDaysController.text.trim();
              String description = descriptionController.text.trim();
              bool isPaid = leaveTypeController.isPaid;
              bool carryForward = leaveTypeController.carryForward;

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty");
              }else if(maxDays.isEmpty){
                showCustomSnackBar("max_days_is_empty");
              }
              else{
                LeaveTypeBody body = LeaveTypeBody(
                  name: name,
                  maxDays: int.parse(maxDays),
                  description: description,
                  isPaid: isPaid,
                  carryForward: carryForward,
                  status: 1,
                  method: update? "put" : "post"
                );
                if(update){
                  leaveTypeController.updateLeaveType(body, int.parse(widget.leaveTypeItem!.id!));
                }else{
                  leaveTypeController.createNewLeaveType(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
        ],);
      }
    );
  }
}
