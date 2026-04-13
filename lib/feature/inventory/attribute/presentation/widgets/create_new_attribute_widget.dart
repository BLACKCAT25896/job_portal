import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAttributeWidget extends StatefulWidget {
  final AttributeItem? attributeItem;
  const CreateNewAttributeWidget({super.key, this.attributeItem});

  @override
  State<CreateNewAttributeWidget> createState() => _CreateNewAttributeWidgetState();
}

class _CreateNewAttributeWidgetState extends State<CreateNewAttributeWidget> {
  TextEditingController nameController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.attributeItem != null) {
      update = true;
      nameController.text = widget.attributeItem?.name??'';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeController>(builder: (attributeController) {
      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          CustomTextField(title: "attribute_name".tr,
            controller: nameController,
            hintText: "enter_attribute_name".tr,),



          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: attributeController.isLoading?
              const Center(child: CircularProgressIndicator()):
              CustomButton(onTap: (){
                String name = nameController.text.trim();
                if(name.isEmpty){
                  showCustomSnackBar("name_is_empty".tr);
                }
                else{
                  if(update){
                    attributeController.updateAttribute(name, widget.attributeItem!.id!);
                  }else{
                    attributeController.createNewAttribute(name);
                  }
                }
               }, text: "confirm".tr))
            ],),
          );
        }
    );
  }
}
