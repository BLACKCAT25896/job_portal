import 'package:ecommerce/common/widget/custom_dropdown.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/add_product_section_title.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        return Row(children: [
          Expanded(flex: 2, child: Column(children: [
            const AddProductSectionTitle(title: "barcode_symbology"),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomDropdown(width: Get.width,
                title:/* update? productController.productDetailsModel?.data?.typeBarcode??'' :*/ "select".tr,
                items: productController.symbologyList,
                selectedValue: productController.selectedBarcodeSymbology,
                onChanged: (val){
                  productController.setSelectedBarcodeSymbology(val!);
                },
              ),),
          ])),

          const SizedBox(width: Dimensions.paddingSizeSmall),

          Expanded(flex: 3, child: Column(children: [
            AddProductSectionTitle(title: "sku_code", onTap: () => productController.randomNumberGenerate()),
            CustomTextField(isAmount: true,
              hintText: 'Ex: 456565',
              prefix: InkWell(onTap :(){
                productController.scanBarCode();
              },
                  child: const Icon(Icons.qr_code)),
              controller: productController.skuCodeController,
            ),
          ])),
        ],);
      }
    );
  }
}
