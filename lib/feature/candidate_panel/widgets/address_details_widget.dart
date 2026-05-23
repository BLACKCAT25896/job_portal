import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/edit_address_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    Widget addressContent = GetBuilder<ProfileController>(builder: (controller) {
      final data = controller.profileModel?.data?.candidateInfo;
        return Column(spacing: Dimensions.paddingSizeDefault,
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            CandidateDetailItem(title: "present_address".tr,
                value: data?.presentAddress ?? "-"),
            CandidateDetailItem(title: "permanent_address".tr,
                value: data?.permanentAddress??'-'),
          ],
        );
      }
    );

    return GetBuilder<CandidatePanelController>(builder: (controller) {

      if (!isDesktop) {
        return addressContent;
      }

      return CustomExpandCollapse(isExpanded: controller.isExpanded("address_details"),
        onChanged: (_) => controller.toggleSection("address_details"),

        header: Text("address_details".tr, style: sectionHeadingTextStyle(context)),

          trailing: CustomIconTextButton(text: "edit".tr, icon: Images.edit,
            onTap: () {
            Get.dialog(CustomDialogWidget(title: "address_details".tr,
                child: EditAddressDetailsWidget()));
            },
          ),
        child: addressContent);
      },
    );
  }
}