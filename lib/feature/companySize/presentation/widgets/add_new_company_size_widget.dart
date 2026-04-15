import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/companySize/controller/company_size_controller.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_body.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_model.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCompanySizeWidget extends StatefulWidget {
  final CompanySizeItem? companySizeItem;
  const AddNewCompanySizeWidget({super.key, this.companySizeItem});

  @override
  State<AddNewCompanySizeWidget> createState() => _AddNewCompanySizeWidgetState();
}

class _AddNewCompanySizeWidgetState extends State<AddNewCompanySizeWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController minSizeController = TextEditingController();
  TextEditingController maxSizeController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.companySizeItem != null){
      update = true;
      nameController.text = widget.companySizeItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanySizeController>(builder: (companySizeController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          CustomTextField(
            controller: minSizeController,
            hintText: "enter_min_size".tr,
            title: "min_size".tr,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
          ),

          CustomTextField(
            controller: maxSizeController,
            hintText: "enter_max_size".tr,
            title: "max_size".tr,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: companySizeController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  String minSize = minSizeController.text.trim();
                  String maxSize = maxSizeController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else if(minSize.isEmpty){
                    showCustomSnackBar("min_size_is_empty".tr);
                  }else if(maxSize.isEmpty){
                    showCustomSnackBar("max_size_is_empty".tr);
                  }
                  else{
                    CompanySizeBody companySizeBody = CompanySizeBody(
                        name: name,
                        slug: name.toLowerCase().replaceAll(" ", "-"),
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      companySizeController.updateCompanySize(companySizeBody, widget.companySizeItem!.id!);
                    }else{
                      companySizeController.createNewCompanySize(companySizeBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
