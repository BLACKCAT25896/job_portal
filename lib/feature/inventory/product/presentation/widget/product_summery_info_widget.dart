// import 'package:ecommerce/api_handle/global_api_response_model.dart';
// import 'package:ecommerce/common/widget/item_widget.dart';
// import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
// import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
// import 'package:ecommerce/util/dimensions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductSummeryInfoWidget extends StatelessWidget {
//   const ProductSummeryInfoWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductController>(
//       builder: (productController) {
//         ApiResponse<Product>? productModel = productController.productModel;
//         return  productModel != null?
//          Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
//           child: Row(children: [
//             Expanded(child: ItemWidget(title: "products", quantity: productModel.metadata?.totalProductCount??0)),
//             Expanded(child: ItemWidget(title: "total_stocks", quantity: productModel.metadata?.totalProductStock??0)),
//             Expanded(child: ItemWidget(title: "free_stocks", quantity: productModel.metadata?.totalProductFreeStock??0))
//           ]),
//         ): const SizedBox();
//       }
//     );
//   }
// }
//
//
