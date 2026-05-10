import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/package_plan/controller/package_controller.dart';
import 'package:job/feature/package_plan/domain/models/package_body.dart';
import 'package:job/feature/package_plan/domain/models/package_model.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';

class CreateNewPackageScreen extends StatefulWidget {
  final PackageItem? packageItem;
  const CreateNewPackageScreen({super.key, this.packageItem});

  @override
  State<CreateNewPackageScreen> createState() => _CreateNewPackageScreenState();
}

class _CreateNewPackageScreenState extends State<CreateNewPackageScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController studentLimitController = TextEditingController();
  TextEditingController branchLimitController = TextEditingController();

   bool update = false;
  @override
  void initState() {
    if(widget.packageItem != null){
      update = true;
      nameController.text = widget.packageItem?.name??'';
      priceController.text = widget.packageItem?.price.toString()??'';
      durationController.text = widget.packageItem?.durationDays.toString()??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(builder: (packageController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          CustomTextField(title: "description".tr,
            controller: descriptionController,
            hintText: "description".tr,),

          CustomTextField(title: "student_limit".tr,
            controller: studentLimitController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: "student_limit".tr,),

          CustomTextField(title: "branch_limit".tr,
            controller: branchLimitController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: "branch_limit".tr,),
          CustomTextField(title: "price".tr,
            controller: priceController,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "price".tr,),

          CustomTextField(title: "duration".tr,
            controller: durationController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: "duration".tr,),




          packageController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

          Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();
              String price = priceController.text.trim();
              String duration = durationController.text.trim();
              String studentLimit = studentLimitController.text.trim();
              String branchLimit = branchLimitController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty");
              }else if(description.isEmpty){
                showCustomSnackBar("description_is_empty");
              }
              else if(price.isEmpty){
                showCustomSnackBar("price_is_empty");
              }else if(duration.isEmpty){
                showCustomSnackBar("duration_is_empty");
              }else if(studentLimit.isEmpty){
                showCustomSnackBar("student_limit_is_empty");
              }
              else if(branchLimit.isEmpty){
                showCustomSnackBar("branch_limit_is_empty");
              }
             else{
                PackageBody body = PackageBody(
                    name: name,
                    description: description,
                    studentLimit: int.parse(studentLimit),
                    branchLimit: int.parse(branchLimit),
                    price: price,
                    durationDays: duration,
                    isCustom: false,
                    status: "1",
                    isFree: false,
                    method: update? "PUT" : "POST"
                );
                if(update){
                  packageController.updatePackage(body, widget.packageItem!.id!);
                }else{
                  packageController.createNewPackage(body);
                }

              }
            }, text: update? "update".tr : "save".tr, width: 120,))
        ],);
      }
    );
  }
}
