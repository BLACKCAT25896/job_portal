import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_body.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_model.dart';
import 'package:ecommerce/feature/inventory/category/presentation/widgets/category_dropdown_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCategoryWidget extends StatefulWidget {
  final CategoryItem? categoryItem;
  const AddNewCategoryWidget({super.key, this.categoryItem});

  @override
  State<AddNewCategoryWidget> createState() => _AddNewCategoryWidgetState();
}

class _AddNewCategoryWidgetState extends State<AddNewCategoryWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    final categoryController = Get.find<CategoryController>();
    if(widget.categoryItem != null){
      update = true;
      nameController.text = widget.categoryItem?.name??'';
      categoryController.selectCategory(widget.categoryItem, notify: false);
        categoryController.isFeatured = widget.categoryItem?.isFeatured == 1;
        categoryController.isHot = widget.categoryItem?.isHot == 1;
        categoryController.isOffer = widget.categoryItem?.isOffer == 1;

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<CategoryController>(builder: (categoryController) {
          return Column(mainAxisSize: MainAxisSize.min,
            spacing: Dimensions.paddingSizeDefault, children: [

            Row(spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(
                  child: Column(spacing: Dimensions.paddingSizeDefault, children: [
                    CustomTextField(title: "name".tr,
                      controller: nameController,
                      hintText: "enter_name".tr,),

                    SelectCategoryWidget(title: "parent_category".tr),

                    Row(spacing: Dimensions.paddingSizeDefault, children: [
                      Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                        children: [
                          Text("featured".tr, style: textRegular),
                          ActiveInActiveWidget(active: categoryController.isFeatured,
                            onChanged: (val){
                            categoryController.toggleIsFeatured();
                          },),
                        ],
                      ),
                      Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                        children: [
                          Text("hot".tr, style: textRegular),
                          ActiveInActiveWidget(active: categoryController.isHot,
                            onChanged: (val){
                            categoryController.toggleIsHot();
                          },),
                        ],
                      ),
                      Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                        children: [
                          Text("offer".tr, style: textRegular),
                          ActiveInActiveWidget(active: categoryController.isOffer,
                            onChanged: (val){
                            categoryController.toggleIsOffer();
                          },),
                        ],
                      ),

                    ]),

                  ],),
                ),

                if(isDesktop)
                  CustomContainer(width: 250,
                    showShadow: false,horizontalPadding: Dimensions.paddingSizeDefault,
                    borderRadius: 0,color: Theme.of(context).scaffoldBackgroundColor,
                    child: ImagePickerWidget(title: "image".tr,
                      guide: "thumbnail_image_guide".tr,
                      onImagePicked:  () => categoryController.pickImage(),
                      pickedFile: categoryController.thumbnail,
                      imageUrl: "${AppConstants.imageBaseUrl}/categories/${widget.categoryItem?.image}",),
                  ),
              ],
            ),

            if(!isDesktop)
            ImagePickerWidget(onImagePicked:  () => categoryController.pickImage(),
              pickedFile: categoryController.thumbnail,
              imageUrl: "${AppConstants.imageBaseUrl}/categories/${widget.categoryItem?.image}",),

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: categoryController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  int? parentId = categoryController.selectedCategoryItem?.id;
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    CategoryBody categoryBody = CategoryBody(
                        name: name,
                        parentId: parentId,
                        method: update? "put":"POST",
                        status: 1,
                        isFeatured: categoryController.isFeatured? 1 : 0,
                        isHot: categoryController.isHot ? 1: 0,
                        isOffer: categoryController.isOffer? 1 : 0);
                    if(update){
                      categoryController.updateCategory(categoryBody, widget.categoryItem!.id!);
                    }else{
                      categoryController.createNewCategory(categoryBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
