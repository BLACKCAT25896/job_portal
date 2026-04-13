
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_body.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/helper/email_checker.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewSupplierWidget extends StatefulWidget {
  final SupplierItem? supplierItem;
  const CreateNewSupplierWidget({super.key, this.supplierItem, });

  @override
  State<CreateNewSupplierWidget> createState() => _CreateNewSupplierWidgetState();
}

class _CreateNewSupplierWidgetState extends State<CreateNewSupplierWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  bool update = false;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierController>(
      builder: (supplierController) {
        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextField(controller: nameController,
                  hintText: "name".tr, title: "name".tr)),
              Expanded(child: CustomTextField(controller: phoneController,
                  inputFormatters: [AppConstants.phoneNumberFormat],
                  inputType: TextInputType.phone,
                  hintText: "phone".tr, title: "phone".tr)),
            ]),
            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextField(controller: emailController,
                  hintText: "email".tr, title: "email".tr)),
              Expanded(child: CustomTextField(controller: addressController,
                  hintText: "address".tr, title: "address".tr)),
            ]),
            ImagePickerWidget(
              pickedFile: supplierController.profileImage,
                imageUrl: "${AppConstants.imageBaseUrl}/suppliers/${supplierController.selectedSupplierItem?.image}",
                onImagePicked: ()=> supplierController.pickImage()),

            supplierController.isLoading? Center(child: CircularProgressIndicator()):
            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String email = emailController.text.trim();
              String phone = phoneController.text.trim();
              String address = addressController.text.trim();
              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }else if(email.isEmpty){
                showCustomSnackBar("email_is_empty".tr);
              }else if(EmailChecker.isNotValid(email)){
                showCustomSnackBar("invalid_email".tr);
              }
              else if(phone.isEmpty){
                showCustomSnackBar("phone_is_empty".tr);
              }else if(address.isEmpty){
                showCustomSnackBar("address_is_empty".tr);
              }else {
                SupplierBody body = SupplierBody(
                    name: name,
                    email: email,
                    phone: phone,
                    address: address);
                if(update){
                  supplierController.editSupplier(body, widget.supplierItem!.id!);
                }else{
                  supplierController.createSupplier(body);
                }
              }
            }, text: "save".tr)
          ]),
        );
      }
    );
  }
}
