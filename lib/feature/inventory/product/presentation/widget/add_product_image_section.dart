
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AddProductImageSection extends StatefulWidget {
  const AddProductImageSection({super.key});
  @override
  AddProductImageSectionState createState() => AddProductImageSectionState();}

class AddProductImageSectionState extends State<AddProductImageSection> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProductController>(builder: (productController) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, children: [
        MasonryGridView.builder(mainAxisSpacing: 8, crossAxisSpacing: 8,
        itemCount: productController.productImage.length + 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150),
        itemBuilder: (context, index) {

          if (index == productController.productImage.length) {
            return CustomContainer(showShadow: false, borderRadius: 5,
              verticalPadding: 5, horizontalPadding: 5,
              child: ImagePickerWidget(onImagePicked: () => productController.pickImage()));
          }

          return CustomContainer(showShadow: false, borderRadius: 5,
            verticalPadding: 5, horizontalPadding: 5,
            child: ImagePickerWidget(isDelete: true,
              pickedFile: productController.productImage[index],
              onImagePicked: () {
                productController.removeImage(index);
              },
            ),
          );
        },
      )]);
      }
    );
  }
}
