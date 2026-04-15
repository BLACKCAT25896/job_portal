import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewExpenseCategoryWidget extends StatefulWidget {
  final ExpenseCategoryItem? depositCategoryItem;
  const CreateNewExpenseCategoryWidget({super.key, this.depositCategoryItem});

  @override
  State<CreateNewExpenseCategoryWidget> createState() => _CreateNewExpenseCategoryWidgetState();
}

class _CreateNewExpenseCategoryWidgetState extends State<CreateNewExpenseCategoryWidget> {

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
    return GetBuilder<ExpanseCategoryController>(
        builder: (expanseCategoryController) {
          return Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(mainAxisSize: MainAxisSize.min, children: [

              CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr),




              Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: expanseCategoryController.isLoading? const Center(child : CircularProgressIndicator()):
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else{
                    if(update){
                      expanseCategoryController.updateExpanseCategory(name, widget.depositCategoryItem!.id!);
                    }else{
                      expanseCategoryController.createNewExpanseCategory(name);
                    }

                  }

                }, text:  "confirm".tr),
              )


            ],),
          );
        }
    );
  }
}
