import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_body.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/add_product_image_section.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/basic_setup_widget.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_thumbnail_picker.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/select_unit_category_brand_widget.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/variant_widget.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductWidget extends StatefulWidget {
  final String? id;
  const AddProductWidget({super.key, this.id});

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> with TickerProviderStateMixin{
  bool update = false;

  @override
  void initState() {
    loadData();
    super.initState();
  }


  Future<void> loadData()async {
    final productController = Get.find<ProductController>();
    if(widget.id != null){
      await productController.getProductDetails(int.parse(widget.id!));
      update = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<ProductController>(builder: (productController) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.paddingSizeDefault,
          mainAxisAlignment: MainAxisAlignment.start, children: [


            Row(spacing: Dimensions.paddingSizeDefault,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: BasicSetupWidget()),
                  if(isDesktop)
                    ProductThumbnailPicker(imageUrl: productController.productDetailsModel?.data?.thumbnail),
                ]),
            if(!isDesktop)
              ProductThumbnailPicker(imageUrl: productController.productDetailsModel?.data?.thumbnail),


            SelectUnitCategoryBrandWidget(),

            const VariantWidget(),
            const AddProductImageSection(),

            Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
              child: GetBuilder<ProductController>(builder: (productController) {
                return productController.isLoading?
                const Center(child: CircularProgressIndicator()):
                CustomButton(onTap: () async {
                  String name = productController.nameController.text;
                  String shortDescription = productController.shortDescriptionController.text;
                  String description = await productController.descriptionController.getText();
                  int? brandId = Get.find<BrandController>().selectedBrandItem?.id;
                  int? categoryId = Get.find<CategoryController>().selectedCategoryItem?.id;
                  int? unitId = Get.find<UnitController>().selectedUnitItem?.id;
                  int totalStock = 0;
                  List<VariantData> variation = [];
                  for(int i = 0; i < productController.variants.length; i++){
                    VariantData variant = VariantData(
                      name: productController.variants[i].nameController.text,
                      sku: productController.variants[i].nameController.text.toLowerCase().replaceAll(" ", "-"),
                      price: productController.variants[i].priceController.text,
                      offerPrice: productController.variants[i].offerPriceController?.text,
                      discount: productController.variants[i].discountController?.text,
                      stockQuantity: productController.variants[i].stockController.text,
                      weight: productController.variants[i].weightController.text,
                      imageFile: productController.variants[i].image,
                      stockTracking: 1,
                      alertStockQuantity: productController.variants[i].stockAlertController.text,
                      isDefault: productController.variants[i].isDefault?? false? 1 : 0,
                      attributes: productController.variants[i].attributes?.
                      map((e) => AttributeData(attributeId: e.attributeId, attributeValueId: e.attributeValueId)).toList(),
                      );
                    totalStock += int.parse(variant.stockQuantity!);
                    variation.add(variant);
                  }

                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else if(unitId == null){
                    showCustomSnackBar("select_unit".tr);
                  }
                  else{
                    ProductBody product = ProductBody(
                      name: name,
                      slug: name.toLowerCase().replaceAll(" ", "-"),
                      productType: "variant",
                      brandId: brandId,
                      unitId: unitId,
                      vat: "0",
                      pst: "0",
                      isFeatured: productController.isFeatured? 1 : 0,
                      isTrending: productController.isTrending? 1 : 0,
                      isBestSelling: productController.isBestSelling? 1 : 0,
                      isFlashDeal: productController.isFlashDeal? 1 : 0,
                      isNew: 1,
                      isPublished: 1,
                      visibility: "public",
                      categories: categoryId != null? [categoryId] : [],
                      shortDescription: shortDescription,
                      description: description,
                      variants: variation,
                      totalStock: totalStock
                    );
                    if(update){
                      productController.updateProduct(product, int.parse(widget.id!));
                    }else{
                      productController.createNewProduct(product);
                    }
                  }
                  }, text: "confirm".tr);
              }),
            )
          ]);
        }
    );
  }
}
