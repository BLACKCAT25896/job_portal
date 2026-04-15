import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:ecommerce/feature/ownership_type/domain/models/ownership_type_body.dart';
import 'package:ecommerce/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewOwnershipTypeWidget extends StatefulWidget {
  final OwnershipTypeItem? ownershipTypeItem;
  const AddNewOwnershipTypeWidget({super.key, this.ownershipTypeItem});

  @override
  State<AddNewOwnershipTypeWidget> createState() => _AddNewOwnershipTypeWidgetState();
}

class _AddNewOwnershipTypeWidgetState extends State<AddNewOwnershipTypeWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.ownershipTypeItem != null){
      update = true;
      nameController.text = widget.ownershipTypeItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnershipTypeController>(builder: (ownershipTypeController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: ownershipTypeController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    OwnershipTypeBody ownershipTypeBody = OwnershipTypeBody(
                        name: name,
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      ownershipTypeController.updateOwnershipType(ownershipTypeBody, widget.ownershipTypeItem!.id!);
                    }else{
                      ownershipTypeController.createNewOwnershipType(ownershipTypeBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
