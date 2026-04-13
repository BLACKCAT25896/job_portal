import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectBrandWidget extends StatefulWidget {
  final String? title;
  const SelectBrandWidget({super.key, this.title});

  @override
  State<SelectBrandWidget> createState() => _SelectBrandWidgetState();
}

class _SelectBrandWidgetState extends State<SelectBrandWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<BrandController>();
    if (controller.brandModel == null) {
      controller.getBrandList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: Dimensions.paddingSizeDefault),
         Text(widget.title?? "brand".tr,
           style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
        GetBuilder<BrandController>(builder: (brandController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown<BrandItem>(
                title: "select_brand",
                items: brandController.brandModel?.data?.data ?? [],
                selectedValue: brandController.selectedBrandItem,
                onChanged: (val) {
                  brandController.selectBrand(val!);
                },
                getLabel: (item) => item.name ?? '',
              ),
            );
          },
        ),
      ],
    );
  }
}
