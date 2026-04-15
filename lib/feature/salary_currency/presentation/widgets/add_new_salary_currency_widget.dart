import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_body.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSalaryCurrencyWidget extends StatefulWidget {
  final SalaryCurrencyItem? salaryCurrencyItem;
  const AddNewSalaryCurrencyWidget({super.key, this.salaryCurrencyItem});

  @override
  State<AddNewSalaryCurrencyWidget> createState() => _AddNewSalaryCurrencyWidgetState();
}

class _AddNewSalaryCurrencyWidgetState extends State<AddNewSalaryCurrencyWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.salaryCurrencyItem != null){
      update = true;
      nameController.text = widget.salaryCurrencyItem?.currencyName??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryCurrencyController>(builder: (salaryCurrencyController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

         ResponsiveMasonryGrid(children: [
           CustomTextField(title: "name".tr,
             controller: nameController,
             hintText: "enter_name".tr,),
           CustomTextField(title: "code".tr,
             controller: codeController,
             hintText: "enter_code".tr,),
           CustomTextField(title: "icon".tr,
             controller: iconController,
             hintText: "enter_icon".tr,),
         ]),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: salaryCurrencyController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  String code = codeController.text.trim();
                  String icon = iconController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else if(code.isEmpty){
                    showCustomSnackBar("code_is_empty".tr);
                  }else if(icon.isEmpty){
                    showCustomSnackBar("icon_is_empty".tr);
                  }
                  else{
                    SalaryCurrencyBody salaryCurrencyBody = SalaryCurrencyBody(
                        currencyName: name,
                        currencyCode: code,
                        currencyIcon: icon,
                        isDefault: true,
                        sMethod: update? "put":"POST",
                        status: 1);
                    if(update){
                      salaryCurrencyController.updateSalaryCurrency(salaryCurrencyBody, widget.salaryCurrencyItem!.id!);
                    }else{
                      salaryCurrencyController.createNewSalaryCurrency(salaryCurrencyBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
