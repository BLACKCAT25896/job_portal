import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/cms_management/explore/domain/model/explore_model.dart';
import 'package:mighty_job/feature/cms_management/explore/logic/explore_controller.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/create_new_explore_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';

class ExploreItemWidget extends StatelessWidget {
  final ExploreItem? exploreItem;
  final int index;
  const ExploreItemWidget({super.key, this.exploreItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      SizedBox(width: 120, child: CustomImage(image: "${AppConstants.baseUrl}/public/storage/explore/${exploreItem?.image}",
          width: 120,height: 60, radius: 5, fit: BoxFit.contain)),
      Expanded(child: CustomTextItemWidget(text: "${exploreItem?.title}")),
      Expanded(child: CustomTextItemWidget(text: exploreItem?.description??'')),
      EditDeleteSection(onEdit: () => _onEdit(context),
          onDelete: () => _onDelete(), isHorizontal: true)
    ]):

    CustomContainer(child: Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
      CustomImage(width: Dimensions.imageSizeBig, height: Dimensions.imageSizeBig, image:"${exploreItem?.image}", fit: BoxFit.contain),

      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextItemWidget(text: "${exploreItem?.title}"),
        CustomTextItemWidget(text: exploreItem?.description??'',),

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
            child: CreateNewExploreWidget(exploreItem: exploreItem),
          ),
        ),
      ),
    );
  }

  void _onDelete() {
    Get.dialog(
      ConfirmationDialog(
        title: "benefit",
        content: "are_you_sure_to_delete_this_benefit".tr,
        onTap: () {
          Get.back();
          Get.find<ExploreController>().deleteExplore(exploreItem?.id ?? 0);
        },
      ),
    );
  }
}

