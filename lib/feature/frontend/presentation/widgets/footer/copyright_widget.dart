import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/frontend/policy_enum.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      color: Theme.of(context).cardColor,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: Text("© ${DateTime.now().year} ${AppConstants.appName}. All Rights Reserved.",
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).hintColor))),

              InkWell(onTap: ()=> Get.toNamed(RouteHelper.getPolicyRoute(PolicyEnum.termsOfService)),
                  child: Text("terms_of_service".tr, style: textRegular.copyWith(color: Theme.of(context).hintColor))),
              InkWell(onTap: () => Get.toNamed(RouteHelper.getPolicyRoute(PolicyEnum.privacyPolicy)),
                  child: Text("privacy_policy".tr, style: textRegular.copyWith(color: Theme.of(context).hintColor))),

            ],
          ),
        ),
      ),
    );
  }
}
