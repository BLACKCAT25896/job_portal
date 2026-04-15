
import 'package:mighty_job/feature/inventory/unit_measurement/domain/model/unit_body.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:mighty_job/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewUnitWidget extends StatefulWidget {
  final UnitItem? unitItem;
  const CreateNewUnitWidget({super.key, this.unitItem});

  @override
  State<CreateNewUnitWidget> createState() => _CreateNewUnitWidgetState();
}

class _CreateNewUnitWidgetState extends State<CreateNewUnitWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.unitItem != null){
      update = true;
      nameController.text = widget.unitItem?.name??'';
      shortNameController.text = widget.unitItem?.code??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitController>(builder: (unitController) {
      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeDefault,  children: [


                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),

                CustomTextField(title: "code".tr,
                  controller: shortNameController,
                  hintText: "code".tr,),



                unitController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                    child: CustomButton(onTap: (){
                      String name = nameController.text.trim();
                      String shortName = shortNameController.text.trim();


                      if(name.isEmpty){
                        showCustomSnackBar("name_is_empty".tr);
                      }
                      else if(shortName.isEmpty){
                        showCustomSnackBar("short_name_is_empty".tr);
                      }
                      else{
                        UnitBody body = UnitBody(
                          name: name,
                          shortName: shortName
                        );
                        if(update){
                          unitController.editUnit(body, widget.unitItem!.id!);
                        }else{
                          unitController.createUnit(body);
                        }

                      }
                    }, text: update? "update".tr : "save".tr))
              ],),
            ),
          );
        }
    );
  }
}
