import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/degree_level/controller/degree_level_controller.dart';
import 'package:mighty_job/feature/degree_level/domain/models/degree_level_body.dart';
import 'package:mighty_job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewDegreeLevelWidget extends StatefulWidget {
  final DegreeLevelItem? degreeLevelItem;
  const AddNewDegreeLevelWidget({super.key, this.degreeLevelItem});

  @override
  State<AddNewDegreeLevelWidget> createState() => _AddNewDegreeLevelWidgetState();
}

class _AddNewDegreeLevelWidgetState extends State<AddNewDegreeLevelWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.degreeLevelItem != null){
      update = true;
      nameController.text = widget.degreeLevelItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DegreeLevelController>(builder: (degreeLevelController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: degreeLevelController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    DegreeLevelBody degreeLevelBody = DegreeLevelBody(
                        name: name,
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      degreeLevelController.updateDegreeLevel(degreeLevelBody, widget.degreeLevelItem!.id!);
                    }else{
                      degreeLevelController.createNewDegreeLevel(degreeLevelBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
