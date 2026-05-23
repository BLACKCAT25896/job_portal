
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_model.dart';
import 'package:job/feature/candidate_links/presentation/widgets/add_new_candidate_link_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_links_screen.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateLinkItemWidget extends StatelessWidget {
  final CandidateLinkItem? candidateLinkItem;
  final int index;
  const CandidateLinkItemWidget({super.key, this.candidateLinkItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return Column(children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Text("${"link".tr} ${index+1}",
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),

          EditDeleteSection(isHorizontal: true, onDelete: (){
            Get.dialog(ConfirmationDialog(
              title: "link", onTap: (){
              Get.back();
              Get.find<CandidateLinkController>().deleteCandidateLink((candidateLinkItem!.id!));
            },));

          }, onEdit: (){
            if(isDesktop){
              Get.dialog(CustomDialogWidget(title: "link".tr,
                  child: AddNewCandidateLinkWidget(candidateLinkItem: candidateLinkItem)));
            }else{
              Get.to(()=> EditLinksScreen(candidateLinkItem: candidateLinkItem));
            }

          },)


        ]),
        ResponsiveMasonryGrid(children: [
          CandidateDetailItem(title: "name".tr,
              value:'${candidateLinkItem?.platform}'),

          CandidateDetailItem(title: "url".tr,
              value:'${candidateLinkItem?.url}'),

        ])
      ],
    );
  }
}