import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/inventory/category/controller/category_controller.dart';
import 'package:mighty_job/feature/inventory/category/domain/models/category_model.dart';
import 'package:mighty_job/feature/inventory/category/presentation/screens/create_new_category_screen.dart';
import 'package:mighty_job/feature/inventory/category/presentation/widgets/add_new_category_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryItem? categoryItem;
  final int index;
  const CategoryItemWidget({super.key,  required this.index, this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
          child: CustomImage(width: Dimensions.imageSize, height: Dimensions.imageSize,
              image: "${AppConstants.imageBaseUrl}/categories/${categoryItem?.image?? ''}")),
      Expanded(child: CustomTextItemWidget(text: categoryItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewCategoryWidget(categoryItem: categoryItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "category", onTap: (){
              Get.back();
              Get.find<CategoryController>().deleteCategory(categoryItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
              child: CustomImage(width: Dimensions.imageSize, height: Dimensions.imageSize,
                  image: categoryItem?.image?? '')),

              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${categoryItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewCategoryScreen(categoryItem: categoryItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "category", onTap: (){
                      Get.back();
                      Get.find<CategoryController>().deleteCategory(categoryItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }