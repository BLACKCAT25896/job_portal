import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/helper/email_checker.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:lottie/lottie.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
   TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: SizedBox(width: 800,
          child: CustomContainer(
            child: Column(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeDefault, children: [
              Image.asset(Images.logo, height: 100, color: systemPrimaryColor()),
              Text("account_deletion_message".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
              CustomTextField(controller: emailController, hintText: "enter_valid_email".tr),
              Align(alignment: Alignment.centerRight,
                  child: CustomButton(onTap: (){
                    String email = emailController.text.trim();
                    if(email.isEmpty){
                      showCustomSnackBar("email_is_empty".tr);
                    }else if(EmailChecker.isNotValid(email)){
                      showCustomSnackBar("enter_valid_email".tr);
                    }else{
                     Get.dialog(
                        Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(width: 400,
                            child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                               Lottie.asset(Images.emailSent),
                                Text("please_check_your_email_you_will_get_a_link_to_delete_your_account".tr,
                                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
                                Align(alignment: Alignment.centerRight,
                                    child: CustomButton(onTap: (){
                                      Get.back();
                                      Get.toNamed(RouteHelper.getInitialRoute());
                                    }, text: "okay".tr)),
                              ],),
                            ),
                          ),
                        )
                     );
                    }
                  }, text: "submit_request".tr)),

            ],
            ),
          ),
        ),
      ),
    );
  }
}
