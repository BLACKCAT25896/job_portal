import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/subscription_widget.dart';
import 'package:ecommerce/common/widget/side_sheet_widget.dart';
import 'package:ecommerce/feature/user_manual/presentation/user_manual_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class SidebarFooterSectionWidget extends StatelessWidget {
  const SidebarFooterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [

      InkWell(onTap: () {
        showModalSideSheet(Get.context!,
            barrierDismissible: true,
            addBackIconButton: false,
            addActions: false,
            addDivider: false,
            body: const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: UserManualWidget()),
            header: "user_manual".tr);
      },
        child: Container(height: 70, decoration: BoxDecoration(color: systemPrimaryColor()),
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                Image.asset(Images.userManual,width: 20, color: Colors.white),
                Text("user_manual".tr, style: textRegular.copyWith(color: Colors.white,
                    fontSize: Dimensions.fontSizeLarge),),
              ]),
            ))),


      const SubscriptionWidget()
    ],);
  }
}
