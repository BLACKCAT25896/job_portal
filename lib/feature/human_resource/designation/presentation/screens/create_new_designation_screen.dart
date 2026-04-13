import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:ecommerce/feature/human_resource/designation/domain/models/designation_model.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewDesignationScreen extends StatefulWidget {
  final DesignationItem? designationItem;
  const CreateNewDesignationScreen({super.key, this.designationItem});

  @override
  State<CreateNewDesignationScreen> createState() => _CreateNewDesignationScreenState();
}

class _CreateNewDesignationScreenState extends State<CreateNewDesignationScreen> {
  TextEditingController nameController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.designationItem != null){
      update = true;
      nameController.text = widget.designationItem?.title??'';
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
          child: GetBuilder<DesignationController>(
            builder: (designationController) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                  child: CustomTitle(title: "add_new_designation")),

                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),


                designationController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                  child: CustomButton(onTap: (){
                    String name = nameController.text.trim();
                    if(name.isEmpty){
                      showCustomSnackBar("name_is_empty");
                    }else{
                      if(update){
                        designationController.updateDesignation(name,  int.parse(widget.designationItem!.id!));
                      }else{
                        designationController.createNewDesignation(name);
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
