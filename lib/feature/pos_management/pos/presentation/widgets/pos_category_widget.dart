import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_model.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class PosCategoryWidget extends StatelessWidget {
   PosCategoryWidget({super.key});


  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    if (_scrollController.hasClients) {
      final double newPosition = _scrollController.position.pixels - 120;
      _scrollController.animateTo(
        newPosition < 0 ? 0 : newPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollRight() {
    if (_scrollController.hasClients) {
      final double maxScroll = _scrollController.position.maxScrollExtent;
      final double newPosition = _scrollController.position.pixels + 120;
      _scrollController.animateTo(
        newPosition > maxScroll ? maxScroll : newPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(initState: (val){
          if(Get.find<CategoryController>().categoryModel == null){
            Get.find<CategoryController>().getCategoryList(1);
          }
        },
        builder: (categoryController) {
          ApiResponse<CategoryItem>? foodCategoryModel = categoryController.categoryModel;
          return foodCategoryModel != null?
          Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(spacing: Dimensions.paddingSizeSmall, children: [
              SizedBox(height: Dimensions.paddingSizeDefault),
                CustomRow(title: "categories".tr,
                    widget: Row(spacing: Dimensions.paddingSizeSmall, children: [
                  CustomContainer(onTap: _scrollLeft,
                      borderRadius: 120, verticalPadding: 5, horizontalPadding: 5,
                      child: Icon(Icons.keyboard_arrow_left_rounded  ,
                          color: systemPrimaryColor())),
                  CustomContainer( onTap: _scrollRight,
                      borderRadius: 120, verticalPadding: 5, horizontalPadding: 5,
                      child: Icon(Icons.keyboard_arrow_right_rounded,
                          color: systemPrimaryColor()))
                ])),
                SizedBox(height: 110,
                  child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryModel.data?.data?.length,
                      itemBuilder: (_, index){
                        CategoryItem? categoryItem = foodCategoryModel.data?.data?[index];
                        return Padding( padding:  EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: CustomContainer(width: 100,
                              showShadow: false, horizontalPadding: 5, borderRadius: 5,
                              verticalPadding: 8,
                              child: Column(spacing: Dimensions.paddingSizeExtraSmall, children: [
                                  CustomImage(radius: 5,
                                    width: 50 , height: 50, image: "${AppConstants.imageBaseUrl}/categories/${categoryItem?.image}",),
                                  Text("${categoryItem?.name}", maxLines: 1, overflow: TextOverflow.ellipsis,
                                      style: textMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),
                                Text("${categoryItem?.productCount??0} ${"items".tr}",
                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                                ],
                              )),
                        );
                      }),
                ),
              ],
            ),
          ):SizedBox();
        }
    );
  }
}
