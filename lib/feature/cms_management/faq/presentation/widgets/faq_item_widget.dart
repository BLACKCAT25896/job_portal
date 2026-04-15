import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/cms_management/faq/domain/model/faq_model.dart';
import 'package:mighty_job/feature/cms_management/faq/logic/faq_controller.dart';
import 'package:mighty_job/feature/cms_management/faq/presentation/widgets/create_new_faq_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class FaqItemWidget extends StatelessWidget {
  final FaqItem? faqItem;
  final int index;
  const FaqItemWidget({super.key, this.faqItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text : "${faqItem?.question}")),
      Expanded(child: CustomTextItemWidget(text: faqItem?.answer??'')),
      EditDeleteSection(onEdit: () => _onEdit(context),
          onDelete: _onDelete, isHorizontal: true)
    ]):

    CustomContainer(showShadow: false, borderRadius: 5,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
        CustomTextItemWidget(text: "${"Q"}. ${faqItem?.question}"),
        CustomTextItemWidget(text: "${"A"}. ${faqItem?.answer??''}"),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
      ])),
      EditDeleteSection(onEdit: () => _onEdit(context),
        onDelete: _onDelete)

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
            child: CreateNewFaqWidget(faqItem: faqItem),
          ),
        ),
      ),
    );
  }

  void _onDelete() {
    Get.dialog(
      ConfirmationDialog(
        title: "faq",
        content: "are_you_sure_to_delete_this_faq".tr,
        onTap: () {
          Get.back();
          Get.find<FaqController>().deleteFaq(faqItem?.id ?? 0);
        },
      ),
    );
  }

}

