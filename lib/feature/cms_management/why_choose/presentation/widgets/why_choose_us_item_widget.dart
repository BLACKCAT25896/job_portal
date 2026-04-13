import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/cms_management/why_choose/domain/model/why_choose_model.dart';
import 'package:ecommerce/feature/cms_management/why_choose/logic/why_choose_controller.dart';
import 'package:ecommerce/feature/cms_management/why_choose/presentation/widgets/create_new_why_choose_us_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class WhyChooseUsItemWidget extends StatelessWidget {
  final WhyChooseItem? whyChooseUsItem;
  final int index;
  const WhyChooseUsItemWidget({super.key, this.whyChooseUsItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
     NumberingWidget(index: index),
      CustomImage(image: "${AppConstants.imageBaseUrl}/why_choose_us/${whyChooseUsItem?.icon}", height: 40, width: 40, fit: BoxFit.contain),
      Expanded(child: CustomTextItemWidget(text:"${whyChooseUsItem?.title}")),
      Expanded(child: CustomTextItemWidget(text:whyChooseUsItem?.description??'')),
      EditDeleteSection(onEdit: () => _openEditDialog(context, whyChooseUsItem),
          onDelete: () => _openDeleteDialog(whyChooseUsItem), isHorizontal: true)
    ]):

    CustomContainer(borderRadius: 5, showShadow: false,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeSmall, children: [
      CustomImage(image: whyChooseUsItem?.icon, height: 50, width: 50, fit: BoxFit.contain),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
        CustomTextItemWidget(text: "${"title".tr}:  ${whyChooseUsItem?.title}"),
        CustomTextItemWidget(text: whyChooseUsItem?.description??''),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
      ])),
      EditDeleteSection(onEdit: () => _openEditDialog(context, whyChooseUsItem),
        onDelete: () => _openDeleteDialog(whyChooseUsItem),)
    ],
    ));
  }
  void _openEditDialog(BuildContext context, WhyChooseItem? item) {
    Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(width: ResponsiveHelper.isDesktop(context) ? 600 : Get.width,
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewWhyChooseUsWidget(whyChooseUsItem: item))),
    ));
  }

  void _openDeleteDialog(WhyChooseItem? item) {
    Get.dialog(ConfirmationDialog(
      title: "why_choose_us",
      content: "are_you_sure_to_delete_this_why_choose_us".tr,
      onTap: () {
        Get.back();
        Get.find<WhyChooseController>().deleteWhyChooseUs(item?.id ?? 0);
      },
    ));
  }

}

