
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/cms_management/banner/domain/model/banner_model.dart';
import 'package:ecommerce/feature/cms_management/banner/logic/banner_controller.dart';
import 'package:ecommerce/feature/cms_management/banner/presentation/widgets/create_new_banner_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';


class BannerItemWidget extends StatelessWidget {
  final BannerItem? bannerItem;
  final int index;
  const BannerItemWidget({super.key, this.bannerItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      CustomImage(image: "${AppConstants.imageBaseUrl}/banners/${bannerItem?.image}",
          width: 60,height: 60, radius: 5),
      Expanded(child: CustomTextItemWidget(text:"${bannerItem?.title}")),
      Expanded(child: CustomTextItemWidget(text: bannerItem?.description??'')),
      Expanded(child: CustomTextItemWidget(text: bannerItem?.buttonName??'')),
      Expanded(child: CustomTextItemWidget(text: bannerItem?.buttonLink??'')),
      EditDeleteSection(onEdit: () => _onEdit(context),
          onDelete: () => _onDelete(),isHorizontal: true)
    ]):

    CustomContainer(showShadow: false, borderRadius: 5,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
      ClipRRect(borderRadius: BorderRadius.circular(120),
          child: CustomImage(width: Dimensions.imageSizeBig, height: Dimensions.imageSizeBig, image: "${bannerItem?.image}")),

      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextItemWidget(text: "${bannerItem?.title}"),
        CustomTextItemWidget(text: bannerItem?.description??''),
        CustomTextItemWidget(text: bannerItem?.buttonName??''),
        CustomTextItemWidget(text: bannerItem?.buttonLink??''),

      ])),
          EditDeleteSection(onEdit: () => _onEdit(context),
            onDelete: () => _onDelete(),)


    ],
    ));
  }
  void _onEdit(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: ResponsiveHelper.isDesktop(context) ? 600 : Get.width,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewBannerWidget(bannerItem: bannerItem),
          ),
        ),
      ),
    );
  }

  void _onDelete() {
    Get.dialog(
      ConfirmationDialog(
        title: "banner",
        content: "are_you_sure_to_delete_this_banner".tr,
        onTap: () {
          Get.back();
          Get.find<BannerController>().deleteBanner(int.parse(bannerItem!.id!));
        },
      ),
    );
  }
}
