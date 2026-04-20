
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_row.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CategoryOrIndustrySelectionWidget extends StatelessWidget {
  const CategoryOrIndustrySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
        return CustomRow(title: "discover_job".tr, fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeExtraLarge,
            widget: CustomContainer(verticalPadding: 0,horizontalPadding: 0,
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
            ));
      }
    );
  }
}
