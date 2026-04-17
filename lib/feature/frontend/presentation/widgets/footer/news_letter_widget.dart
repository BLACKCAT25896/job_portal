import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/frontend_custom_button.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class NewsLetterWidget extends StatefulWidget {
  const NewsLetterWidget({super.key});

  @override
  State<NewsLetterWidget> createState() => _NewsLetterWidgetState();
}

class _NewsLetterWidgetState extends State<NewsLetterWidget> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (landingPageController) {
        return Column(spacing: Dimensions.paddingSizeDefault, children: [
          Text("${"stay_updated".tr} ${AppConstants.appName}",
            textAlign: TextAlign.center, style: landingBoldFont.copyWith(
              fontSize: ResponsiveHelper.isDesktop(context)?
                min(MediaQuery.sizeOf(context).width * 0.034, 24) : 20),),


          TextFormField(controller: emailController,
            style:  textRegular.copyWith(),
            decoration: InputDecoration(
              hintText: "your_email".tr,
              hintStyle:  textRegular.copyWith(color: Theme.of(context).hintColor),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              suffixIcon: landingPageController.isLoading? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
                  :
              IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FrontendCustomButton(onTap: (){
                    String email = emailController.text.trim();
                    if(email.isEmpty){
                      showCustomSnackBar("enter_email_address".tr);
                    }else if(!GetUtils.isEmail(email)){
                      showCustomSnackBar("enter_valid_email_address".tr);
                    }else{
                      Get.find<LandingPageController>().newsLetter(email);
                    }
                  }, text: "subscribe".tr),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

        ],
        );
      }
    );
  }
}
