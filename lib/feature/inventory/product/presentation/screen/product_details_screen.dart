import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/edit_delete_bottom_section.dart';
import 'package:ecommerce/common/widget/html_preview_widget.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_details_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/screen/add_product_screen.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/details/gallery_image_widget.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/details/title_section.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    Get.find<ProductController>().getProductDetails(int.parse(widget.id!));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"product_details".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(
            child: GetBuilder<ProductController>(builder: (productController) {
            ProductDetailsModel? productDetailsModel = productController.productDetailsModel;
            return productDetailsModel != null?

              Padding(padding: const EdgeInsets.symmetric(
                  horizontal : Dimensions.paddingSizeDefault),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Dimensions.paddingSizeDefault,
                    mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: Dimensions.paddingSizeLarge),

                      TitleSection(productDetailsModel: productDetailsModel),
                      GalleryImageWidget(productDetailsModel: productDetailsModel),

                      HtmlViewer(htmlContent: productDetailsModel.data?.description??''),

                ]),
              ): Padding(
              padding: EdgeInsets.only(top: Get.height/3),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        ))

      ],),
      bottomNavigationBar: !ResponsiveHelper.isDesktop(context)?
      Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: EditDeleteBottomSection(
          edit: ()=> Get.to(()=> AddProductScreen(id: widget.id)),
          delete: ()=> Get.find<ProductController>().deleteProduct(int.parse(widget.id!)),
        ),
      ):SizedBox(),
    );
  }
}
