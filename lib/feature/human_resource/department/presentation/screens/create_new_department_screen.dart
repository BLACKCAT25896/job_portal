import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/human_resource/department/controller/department_controller.dart';
import 'package:mighty_job/feature/human_resource/department/domain/models/department_model.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewDepartmentScreen extends StatefulWidget {
  final DepartmentItem? departmentItem;
  const CreateNewDepartmentScreen({super.key, this.departmentItem});

  @override
  State<CreateNewDepartmentScreen> createState() => _CreateNewDepartmentScreenState();
}

class _CreateNewDepartmentScreenState extends State<CreateNewDepartmentScreen> {
  TextEditingController nameController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.departmentItem != null){
      update = true;
      nameController.text = widget.departmentItem?.name??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(insetPadding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      child: SizedBox(width: ResponsiveHelper.isDesktop(context)? 500 : Get.width,
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: GetBuilder<DepartmentController>(builder: (departmentController) {
              return Column(mainAxisSize: MainAxisSize.min, children: [

                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),


                departmentController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                  child: CustomButton(onTap: (){
                    String name = nameController.text.trim();
                    if(name.isEmpty){
                      showCustomSnackBar("name_is_empty");
                    }else{
                      if(update){
                        departmentController.updateDepartment(name, int.parse(widget.departmentItem!.id!));
                      }else{
                        departmentController.createNewDepartment(name);
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
