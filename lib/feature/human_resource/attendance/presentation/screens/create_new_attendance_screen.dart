import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/human_resource/attendance/domain/models/attendance_model.dart';
import 'package:ecommerce/feature/human_resource/attendance/controller/attendance_controller.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewAttendanceScreen extends StatefulWidget {
  final AttendanceItem? attendanceItem;
  const CreateNewAttendanceScreen({super.key, this.attendanceItem});

  @override
  State<CreateNewAttendanceScreen> createState() => _CreateNewAttendanceScreenState();
}

class _CreateNewAttendanceScreenState extends State<CreateNewAttendanceScreen> {
  TextEditingController nameController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.attendanceItem != null){
      update = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(insetPadding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      child: SizedBox(width: ResponsiveHelper.isDesktop(context)? 500 : Get.width,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: GetBuilder<AttendanceController>(
            builder: (attendanceController) {
              return Column(mainAxisSize: MainAxisSize.min, children: [

                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),

                attendanceController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                  child: CustomButton(onTap: (){
                    String name = nameController.text.trim();
                    if(name.isEmpty){
                      showCustomSnackBar("name_is_empty");
                    }else{
                      if(update){
                        attendanceController.updateAttendance(name, widget.attendanceItem!.id!);
                      }else{
                        attendanceController.createNewAttendance(name);
                      }

                    }
                  }, text: update? "update".tr : "save".tr))
              ],);
            }
          ),
        ),
      ),
    );
  }
}
