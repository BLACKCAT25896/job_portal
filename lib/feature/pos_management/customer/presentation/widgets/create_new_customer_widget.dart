import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_body.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewCustomerWidget extends StatefulWidget {
  final CustomerItem? customerItem;
  const CreateNewCustomerWidget({super.key, this.customerItem});

  @override
  State<CreateNewCustomerWidget> createState() => _CreateNewCustomerWidgetState();
}

class _CreateNewCustomerWidgetState extends State<CreateNewCustomerWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.customerItem != null){
      update = true;
      firstNameController.text = widget.customerItem?.name??'N/a';
      emailController.text =  widget.customerItem?.email??'';
      phoneController.text =  widget.customerItem?.phone??'';
      addressController.text =  widget.customerItem?.address??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: GetBuilder<CustomerController>(builder: (customerController) {
        return SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [

            ImagePickerWidget(onImagePicked: ()=> customerController.pickImage(),
                imageUrl: "${AppConstants.imageBaseUrl}/users/${widget.customerItem?.avatar}",
                pickedFile: customerController.thumbnail),

            CustomTextField(title: "first_name".tr,
              controller: firstNameController,
              hintText: "enter_first_name".tr,),


            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextField(title: "email".tr,
                controller: emailController,
                hintText: "enter_email".tr,)),
              Expanded(child: CustomTextField(title: "phone".tr,
                controller: phoneController,
                hintText: "enter_phone".tr,)),

            ],),



            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextField(title: "address".tr,
                controller: addressController,
                hintText: "enter_address".tr,)),

            ],),


            customerController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String firstName = firstNameController.text.trim();
                  String email = emailController.text.trim();
                  String phone = phoneController.text.trim();
                  String address = addressController.text.trim();
                  if(firstName.isEmpty){
                    showCustomSnackBar("first_name_is_empty".tr);
                  }
                  else if(email.isNotEmpty && !GetUtils.isEmail(email)){
                    showCustomSnackBar("invalid_email".tr);
                  }
                  else if(phone.isEmpty){
                    showCustomSnackBar("phone_is_empty".tr);
                  }
                  else{
                    CustomerBody body = CustomerBody(
                        name: firstName,
                        email: email,
                        phone: phone,
                        address: address,
                        status: 1,
                        sMethod: update? "put" : "post"
                    );
                    if(update){
                      customerController.editCustomer(body,(widget.customerItem!.id!));
                    }else{
                      customerController.createCustomer(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],),
        );
      }
      ),
    );
  }
}
