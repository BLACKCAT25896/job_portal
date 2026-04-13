import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/select_attribute_widget.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAttributeValueWidget extends StatefulWidget {
  final AttributeValueItem? attributeValueItem;
  const CreateNewAttributeValueWidget({super.key, this.attributeValueItem});

  @override
  State<CreateNewAttributeValueWidget> createState() => _CreateNewAttributeValueWidgetState();
}

class _CreateNewAttributeValueWidgetState extends State<CreateNewAttributeValueWidget> {
  TextEditingController nameController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.attributeValueItem != null) {
      update = true;
      nameController.text = widget.attributeValueItem?.value??'';
      Get.find<AttributeController>().selectAttribute(AttributeItem(
        id: widget.attributeValueItem?.attributeId,
        name: widget.attributeValueItem?.attributeName,
      ), notify: false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeValueController>(builder: (attributeController) {
      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(mainAxisSize: MainAxisSize.min, children: [



          SelectAttributeWidget(title: "select_attribute".tr,),

          CustomTextField(title: "attribute_value_name".tr,
            controller: nameController,
            hintText: "enter_attribute_name".tr,),


          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: attributeController.isLoading?
              const Center(child: CircularProgressIndicator()):
              CustomButton(onTap: (){
                int? attributeId = Get.find<AttributeController>().selectedAttributeItem?.id;
                String name = nameController.text.trim();
                if(name.isEmpty){
                  showCustomSnackBar("name_is_empty".tr);
                }else if(attributeId == null){
                  showCustomSnackBar("select_attribute".tr);
                }
                else{

                  if(update){
                    attributeController.updateAttributeValue(attributeId,name, widget.attributeValueItem!.id!);
                  }else{
                    attributeController.createNewAttributeValue(attributeId, name);
                  }
                }
               }, text: "confirm".tr))
            ],),
          );
        }
    );
  }
}
