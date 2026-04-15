import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PolicyPagesTypeWidget extends StatelessWidget {
  const PolicyPagesTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(
      builder: (pagesController) {
        return Row(spacing: Dimensions.paddingSizeDefault, children: [

          CustomContainer(borderRadius: 5, onTap: (){
            pagesController.setSelectedPageIndex(0);
          }, color: pagesController.selectedPageIndex == 0? systemPrimaryColor()
              :Theme.of(context).hintColor,
              child: Text("privacy_policy".tr, style: textRegular.copyWith(
                  color : pagesController.selectedPageIndex == 0? Colors.white : null),)),

          CustomContainer(borderRadius: 5,onTap: (){
            pagesController.setSelectedPageIndex(1);
          }, color: pagesController.selectedPageIndex == 1? systemPrimaryColor()
              :Theme.of(context).hintColor,
              child: Text("cookies_policy".tr, style: textRegular.copyWith(
                  color : pagesController.selectedPageIndex == 1? Colors.white : null))),

          CustomContainer(borderRadius: 5, onTap: (){
            pagesController.setSelectedPageIndex(2);
          }, color: pagesController.selectedPageIndex == 2? systemPrimaryColor()
              :Theme.of(context).hintColor,
              child: Text("terms_and_conditions".tr, style: textRegular.copyWith(
                  color : pagesController.selectedPageIndex == 2? Colors.white : null))),
          CustomContainer(borderRadius: 5, onTap: (){
            pagesController.setSelectedPageIndex(3);
          }, color: pagesController.selectedPageIndex == 3? systemPrimaryColor()
              :Theme.of(context).hintColor,
              child: Text("about_us".tr, style: textRegular.copyWith(
                  color : pagesController.selectedPageIndex == 3? Colors.white : null))),
        ]);
      }
    );
  }
}
