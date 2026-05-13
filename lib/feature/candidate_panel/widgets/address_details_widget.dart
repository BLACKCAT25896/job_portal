import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(
      builder: (controller) {
        return CustomExpandCollapse(
            isExpanded: controller.isExpanded("address_details"),
            onChanged: (v) => controller.toggleSection("address_details"),
            header: Text("address_details".tr,
          style: sectionHeadingTextStyle(context),),
            trailing: CustomIconTextButton(text: "edit".tr,onTap: (){}, icon: Images.edit),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeDefault,
              children: [
                CandidateDetailItem(title: "present_address".tr, value: "present address"),
                CandidateDetailItem(title: "permanent_address".tr, value: "permanent address"),
              ],
            ));
      }
    );
  }
}
