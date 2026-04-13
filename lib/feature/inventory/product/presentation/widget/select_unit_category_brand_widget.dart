import 'package:ecommerce/common/widget/custom_checkbox.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/screens/create_new_brand_screen.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/widgets/select_brand_widget.dart';
import 'package:ecommerce/feature/inventory/category/presentation/screens/create_new_category_screen.dart';
import 'package:ecommerce/feature/inventory/category/presentation/widgets/category_dropdown_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/add_new_type_widget.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/screens/create_new_unit_screen.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/widgets/select_unit_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUnitCategoryBrandWidget extends StatelessWidget {
  const SelectUnitCategoryBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return CustomContainer(
          showShadow: false,
          borderRadius: 5,
          child: ResponsiveMasonryGrid(
            width: 280,
            children: [

              _selectionRow(
                child: const SelectCategoryWidget(),
                onTap: () => Get.to(() => const CreateNewCategoryScreen()),
              ),

              _selectionRow(
                child: const SelectBrandWidget(),
                onTap: () => Get.to(() => const CreateNewBrandScreen()),
              ),

              _selectionRow(
                child: const SelectUnitWidget(),
                onTap: () => Get.to(() => const CreateNewUnitScreen()),
              ),

              _checkboxItem(
                context,
                label: "best_selling".tr,
                value: controller.isBestSelling,
                title: "best_selling".tr,
                onTap: controller.toggleBestSelling,
              ),

              _checkboxItem(
                context,
                label: "featured".tr,
                value: controller.isFeatured,
                title: "featured".tr,
                onTap: controller.toggleFeatured,
              ),

              _checkboxItem(
                context,
                label: "flash_deal".tr,
                value: controller.isFlashDeal,
                title: "flash_deal".tr,
                onTap: controller.toggleFlashDeal,
              ),

              _checkboxItem(
                context,
                label: "trending".tr,
                value: controller.isTrending,
                title: "trending".tr,
                onTap: controller.toggleTrending,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _selectionRow({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: child),
        AddNewTypeButtonWidget(onTap: onTap),
      ],
    );
  }

  Widget _checkboxItem(
      BuildContext context, {
        required String label,
        required bool value,
        required String title,
        required VoidCallback onTap,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(label, style: textRegular.copyWith()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomContainer(
            borderRadius: 5,
            showShadow: false,
            horizontalPadding: Dimensions.paddingSizeDefault,
            verticalPadding: 2,
            border: Border.all(
              width: .25,
              color: Theme.of(context).hintColor,
            ),
            child: CustomCheckbox(
              value: value,
              title: title,
              onChange: onTap,
            ),
          ),
        ),
      ],
    );
  }
}