import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/skill/controller/skill_controller.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_body.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSkillWidget extends StatefulWidget {
  final SkillItem? skillItem;
  const AddNewSkillWidget({super.key, this.skillItem});

  @override
  State<AddNewSkillWidget> createState() => _AddNewSkillWidgetState();
}

class _AddNewSkillWidgetState extends State<AddNewSkillWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.skillItem != null){
      update = true;
      nameController.text = widget.skillItem?.name??'';
      descriptionController.text = widget.skillItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillController>(builder: (skillController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          CustomTextField(title: "description".tr,
          controller: descriptionController,
          hintText: "enter_description".tr,),


          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: skillController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  String description = descriptionController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    SkillBody skillBody = SkillBody(
                        name: name,
                        description: description,
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      skillController.updateSkill(skillBody, widget.skillItem!.id!);
                    }else{
                      skillController.createNewSkill(skillBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
