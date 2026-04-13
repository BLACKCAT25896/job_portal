import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/role_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/role_and_permission/role/controller/role_controller.dart';
import 'package:ecommerce/feature/role_and_permission/role/presentation/widgets/select_roll_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_body.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewUserWidget extends StatefulWidget {
  final UserItem? userItem;
  const CreateNewUserWidget({super.key, this.userItem});

  @override
  State<CreateNewUserWidget> createState() => _CreateNewUserWidgetState();
}

class _CreateNewUserWidgetState extends State<CreateNewUserWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.userItem != null){
      update = true;
      firstNameController.text = widget.userItem?.firstName??'N/a';
      lastNameController.text =  widget.userItem?.lastName??'';
      emailController.text =  widget.userItem?.email??'';
      phoneController.text =  widget.userItem?.phone??'';
      addressController.text =  widget.userItem?.address??'';
      Get.find<RoleController>().setRoleItem(RoleItem(
        id: int.parse(widget.userItem!.roleId!),
        name: widget.userItem?.userType,
      ));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
        return SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [

            ImagePickerWidget(onImagePicked: ()=> userController.pickImage(),
                imageUrl: "${AppConstants.imageBaseUrl}/users/${widget.userItem?.avatar}",
                pickedFile: userController.userImage),

            ResponsiveMasonryGrid(children: [
              CustomTextField(title: "first_name".tr,
                  controller: firstNameController,
                  hintText: "enter_first_name".tr),

              CustomTextField(title: "last_name".tr,
                  controller: lastNameController,
                  hintText: "enter_last_name".tr),

              CustomTextField(title: "email".tr,
                controller: emailController,
                hintText: "enter_email".tr,),

              CustomTextField(title: "phone".tr,
                  controller: phoneController,
                  inputType: TextInputType.phone,
                  inputFormatters: [AppConstants.phoneNumberFormat],
                  hintText: "enter_phone".tr),

              CustomTextField(title: "password".tr,
                controller: passwordController,
                hintText: "enter_password".tr),

              CustomTextField(title: "confirm_password".tr,
                controller: confirmController,
                hintText: "enter_confirm_password".tr),
              SelectRoleWidget(),
              CustomTextField(title: "address".tr,
                controller: addressController,
                hintText: "enter_address".tr,),


            ]),




            userController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: CustomButton(onTap: (){
                String firstName = firstNameController.text.trim();
                String lastName = lastNameController.text.trim();
                String email = emailController.text.trim();
                String phone = phoneController.text.trim();
                String address = addressController.text.trim();
                String password = passwordController.text.trim();
                String confirm = confirmController.text.trim();
                int? selectedRole = Get.find<RoleController>().selectedRoleItem?.id;
                if(firstName.isEmpty){
                  showCustomSnackBar("first_name_is_empty".tr);
                }else if(lastName.isEmpty){
                  showCustomSnackBar("last_name_is_empty".tr);
                }else if(email.isEmpty){
                  showCustomSnackBar("email_is_empty".tr);
                }
                else if(!GetUtils.isEmail(email)){
                  showCustomSnackBar("invalid_email".tr);
                }
                else if(phone.isEmpty){
                  showCustomSnackBar("phone_is_empty".tr);
                }else if(address.isEmpty){
                  showCustomSnackBar("address_is_empty".tr);
                }
                else if(password.isEmpty){
                  showCustomSnackBar("password_is_empty".tr);
                }
                else if(confirm.isEmpty){
                  showCustomSnackBar("confirm_password_is_empty".tr);
                }
                else if(password != confirm){
                  showCustomSnackBar("password_not_match".tr);
                }
                else if(selectedRole == null){
                  showCustomSnackBar("select_roll".tr);
                }else{
                  UserBody body = UserBody(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    address: address,
                    password: password,
                    passwordConfirmation: confirm,
                    roleId: selectedRole,
                    sMethod: update? "put" : "post"
                  );
                  if(update){
                    userController.updateUser(body,  int.parse(widget.userItem!.id!));
                  }else{
                    userController.createNewUser(body);
                  }

                }
              }, text: update? "update".tr : "save".tr))
          ],),
        );
      }
    );
  }
}
