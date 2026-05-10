import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/edit_delete_popup_widget.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:job/feature/job_listing/presentation/screens/post_a_job_screen.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobListingItemWidget extends StatelessWidget {
  final JobListingItem? listingItem;
  final int index;
  const JobListingItemWidget({super.key,  required this.index, this.listingItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: listingItem?.jobTitle??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: PostAJobWidget(listingItem: listingItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "listing", onTap: (){
              Get.back();
              Get.find<JobListingController>().deleteJobListing(listingItem!.id!);
              },));

          })
    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${listingItem?.jobTitle}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> PostAJobScreen(listingItem: listingItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "listing", onTap: (){
                      Get.back();
                      Get.find<JobListingController>().deleteJobListing(listingItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }