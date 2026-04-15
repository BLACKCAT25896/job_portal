import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/cms_management/feedback/domain/model/feedback_model.dart';
import 'package:mighty_job/feature/cms_management/feedback/logic/feedback_controller.dart';
import 'package:mighty_job/feature/cms_management/feedback/presentation/widgets/create_new_feedback_widget.dart';
import 'package:mighty_job/feature/profile/domain/model/status_update_body.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';

class FeedbackItemWidget extends StatelessWidget {
  final FeedbackItem? feedbackItem;
  final int index;
  const FeedbackItemWidget({super.key, this.feedbackItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: ResponsiveHelper.isDesktop(context)?
      Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
        NumberingWidget(index: index),
        CustomImage(image: "${AppConstants.imageBaseUrl}/testimonials/${feedbackItem?.thumbnailImage ?? ''}", height: 50, width: 50, fit: BoxFit.cover),
        Expanded(child: CustomTextItemWidget(text: "${feedbackItem?.name}")),
        Expanded(child: CustomTextItemWidget(text: feedbackItem?.description?.toString()??'N/A')),
        Expanded(child: CustomTextItemWidget(text: feedbackItem?.description??'N/A')),
        ActiveInActiveWidget(active: feedbackItem?.status == 1, onChanged: (val){
          StatusUpdateBody body = StatusUpdateBody(id: feedbackItem?.id,
              type: "testimonial", status: val ? "1" : "0");
          Get.find<ProfileController>().globalStatusUpdate(body,
              onSuccess: ()=> Get.find<FeedbackController>().getFeedback(1));
        },),
        EditDeletePopupMenu(onEdit: () => _openEditDialog(context),
            onDelete: () => _confirmDelete(context))
      ]):

      CustomContainer(showShadow: false, borderRadius: 5,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeExtraSmall, children: [
          CustomTextItemWidget(text:"${feedbackItem?.name}"),
          CustomTextItemWidget(text:"${"rating"}: ${feedbackItem?.description??''}"),
          CustomTextItemWidget(text: "${"review"}: ${feedbackItem?.description.toString()??''}"),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        ])),
        EditDeleteSection(onEdit: () => _openEditDialog(context),
          onDelete: () => _confirmDelete(context),)
      ],
      )),
    );
  }
  void _openEditDialog(BuildContext context) {
    Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(width: ResponsiveHelper.isDesktop(context) ? 600 : Get.width,
          child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewFeedbackWidget(feedbackItem: feedbackItem),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    Get.dialog(ConfirmationDialog(title: "feedback",
        content: "are_you_sure_to_delete_this_feedback".tr,
        onTap: () {
          Get.back();
          Get.find<FeedbackController>().deleteFeedback(feedbackItem?.id ?? 0);
        },
      ),
    );
  }
}

