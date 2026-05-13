import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CandidatePersonalDetailsWidget extends StatelessWidget {
  const CandidatePersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(
      builder: (controller) {
        return CustomExpandCollapse(
          initiallyExpanded: true,
            isExpanded: controller.isExpanded("personal_details"),
            onChanged: (v) => controller.toggleSection("personal_details"),
            header: Text("personal_details".tr, style: sectionHeadingTextStyle(context)),
          trailing: CustomIconTextButton(text: "edit".tr,onTap: (){

          },icon: Images.edit),
          child: Column(spacing: Dimensions.paddingSizeDefault, children: [
            Row(spacing: Dimensions.paddingSizeSmall, children: [
              CustomImage(width: 70, height: 70, radius: 123, image: ""),
              Column(spacing: Dimensions.paddingSizeExtraSmall,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(spacing: Dimensions.paddingSizeSmall, children: [
                      CustomContainer(borderRadius: 5, showShadow: false,
                          border: Border.all(width: .25, color: Theme.of(context).hintColor),
                          child: Text("change_image".tr)),
                      Text("or".tr),
                      Text("delete".tr,
                          style: textRegular.copyWith(color: Theme.of(context).colorScheme.error)),
                    ]),
                    Text("upload_your_profile_image".tr, style: textRegular)
                  ])
            ]),
            ResponsiveMasonryGrid(children:  [
              CandidateDetailItem(title: "first_name".tr, value: "Md"),
              CandidateDetailItem(title: "last_name".tr, value: "Hasan"),
              CandidateDetailItem(title: "fathers_name", value: "Abdul Karim"),
              CandidateDetailItem(title: "mothers_name", value: "Rahima Begum"),
              CandidateDetailItem(title: "date_of_birth".tr, value: "25 Aug 2020"),
              CandidateDetailItem(title: "gender".tr, value: "Male"),
              CandidateDetailItem(title: "religion".tr, value: "Muslim"),
              CandidateDetailItem(title: "marital_status".tr, value: "Single"),
              CandidateDetailItem(title: "nationality".tr, value: "Bangladeshi"),
              CandidateDetailItem(title: "national_id_number".tr, value: "-"),
              CandidateDetailItem(title: "passport_number".tr, value: "-"),
              CandidateDetailItem(title: "passport_expiry_date".tr, value: "-"),
              CandidateDetailItem(title: "primary_mobile".tr, value: "-"),
              CandidateDetailItem(title: "secondary_mobile".tr, value: "-"),
              CandidateDetailItem(title: "primary_email".tr, value: "-"),
              CandidateDetailItem(title: "alternative_email".tr, value: "-"),
              CandidateDetailItem(title: "emergency_contact".tr, value: "-"),
              CandidateDetailItem(title: "blood_group".tr, value: "-"),
              CandidateDetailItem(title: "height".tr, value: "-"),
              CandidateDetailItem(title: "weight".tr, value: "-"),
              ],
            ),
          ],));
      }
    );
  }
}
class CandidateDetailItem extends StatelessWidget {
  final String title;
  final String value;
  const CandidateDetailItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        Text(title, style: textRegular.copyWith(
            fontSize: Dimensions.fontSizeExtraSmall,
            color: Theme.of(context).hintColor)),
        Text(value, style: textRegular),
      ],
    );
  }
}