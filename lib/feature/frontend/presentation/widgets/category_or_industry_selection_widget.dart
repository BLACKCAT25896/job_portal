
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CategoryOrIndustrySelectionWidget extends StatelessWidget {
  const CategoryOrIndustrySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<LandingPageController>(builder: (controller) {
        return isDesktop?
        Row(children: [
          Expanded(child: Text("discover_job".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),
          CustomContainer(verticalPadding: 0,horizontalPadding: 0,
            showShadow: false,
            borderRadius: 5,border: Border.all(color: Theme.of(context).primaryColor),
            child: Row(children: [
              CustomContainer(borderRadius: 5,showShadow: false,
                  color: controller.isCategorySelected? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                  onTap: ()=> controller.toggleCategorySelection(),
                  child: Text("category".tr,  style: textRegular.copyWith(
                    color: controller.isCategorySelected? Theme.of(context).cardColor : Theme.of(context).primaryColor,
                  ))),
              CustomContainer(borderRadius: 5,showShadow: false,
                  color: !controller.isCategorySelected? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                  onTap: ()=> controller.toggleCategorySelection(),
                  child: Text("industry".tr, style: textRegular.copyWith(
                    color: !controller.isCategorySelected? Theme.of(context).cardColor : Theme.of(context).primaryColor,
                  ))),
            ]),
          )
        ],
        ):Column(spacing: Dimensions.paddingSizeDefault,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("discover_job".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
          CustomContainer(verticalPadding: 0,horizontalPadding: 0,
            showShadow: false,
            borderRadius: 5,border: Border.all(color: Theme.of(context).primaryColor),
            child: Row(children: [
              Expanded(
                child: CustomContainer(borderRadius: 5,showShadow: false,
                    color: controller.isCategorySelected? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                    onTap: ()=> controller.toggleCategorySelection(),
                    child: Center(
                      child: Text("category".tr,  style: textRegular.copyWith(
                        color: controller.isCategorySelected? Theme.of(context).cardColor : Theme.of(context).primaryColor,
                      )),
                    )),
              ),
              Expanded(
                child: CustomContainer(borderRadius: 5,showShadow: false,
                    color: !controller.isCategorySelected? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                    onTap: ()=> controller.toggleCategorySelection(),
                    child: Center(
                      child: Text("industry".tr, style: textRegular.copyWith(
                        color: !controller.isCategorySelected? Theme.of(context).cardColor : Theme.of(context).primaryColor,
                      )),
                    )),
              ),
            ]),
          )
        ],
        );
      }
    );
  }
}
