import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewDepositCategoryWidget extends StatefulWidget {
  final DepositCategoryItem? depositCategoryItem;
  const CreateNewDepositCategoryWidget({super.key, this.depositCategoryItem});

  @override
  State<CreateNewDepositCategoryWidget> createState() => _CreateNewDepositCategoryWidgetState();
}

class _CreateNewDepositCategoryWidgetState extends State<CreateNewDepositCategoryWidget> {

  TextEditingController nameController = TextEditingController();
  bool update = false;

  @override
  void initState() {
    if(widget.depositCategoryItem != null){
      update = true;
      nameController.text = widget.depositCategoryItem?.name??'';
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositCategoryController>(
        builder: (depositCategoryController) {
          return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(mainAxisSize: MainAxisSize.min, children: [

              CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr),



              Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: depositCategoryController.isLoading? const Center(child: CircularProgressIndicator(),):
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else{
                    if(update){
                      depositCategoryController.updateDepositCategory(name, widget.depositCategoryItem?.id??0);
                    }else{
                      depositCategoryController.createNewDepositCategory(name);
                    }

                  }

                }, text:  "confirm".tr, ),
              )


            ],),
          );
        }
    );
  }
}
