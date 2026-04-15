import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/career_level/controller/career_level_controller.dart';
import 'package:mighty_job/feature/career_level/domain/models/career_level_body.dart';
import 'package:mighty_job/feature/career_level/domain/models/career_level_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCareerLevelWidget extends StatefulWidget {
  final CareerLevelItem? careerLevelItem;
  const AddNewCareerLevelWidget({super.key, this.careerLevelItem});

  @override
  State<AddNewCareerLevelWidget> createState() => _AddNewCareerLevelWidgetState();
}

class _AddNewCareerLevelWidgetState extends State<AddNewCareerLevelWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.careerLevelItem != null){
      update = true;
      nameController.text = widget.careerLevelItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CareerLevelController>(builder: (careerLevelController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: careerLevelController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    CareerLevelBody careerLevelBody = CareerLevelBody(
                        name: name,
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      careerLevelController.updateCareerLevel(careerLevelBody, widget.careerLevelItem!.id!);
                    }else{
                      careerLevelController.createNewCareerLevel(careerLevelBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
