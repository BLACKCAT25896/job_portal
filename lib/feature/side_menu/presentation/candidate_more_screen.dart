import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_panel/screens/candidate_short_and_details_profile_resume_screen.dart';
import 'package:job/feature/frontend/policy_enum.dart';
import 'package:job/feature/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CandidateMoreScreen extends StatefulWidget {
  const CandidateMoreScreen({super.key});

  @override
  State<CandidateMoreScreen> createState() => _CandidateMoreScreenState();
}

class _CandidateMoreScreenState extends State<CandidateMoreScreen> {
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "more".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: GetBuilder<SideBarController>(
            initState: (value){
              if(Get.find<ProfileController>().profileModel == null){
                Get.find<ProfileController>().getProfileInfo();
              }
            },
            builder: (controller) {
              return Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(children: [
                  ResponsiveMasonryGrid(children: [
                    MoreMenuItemWidget(onTap: (){
                      Get.to(()=> CandidateShortAndDetailsProfileResumeScreen());
                    },
                        icon: Images.profile, title: "view_profile".tr),
                    MoreMenuItemWidget(icon: Images.profile, title: "manage_profile".tr),

                  ]),

                  ProfileMenuItemWidget(
                      onTap: (){
                        Get.toNamed(RouteHelper.getContactUsRoute());
                      },
                      icon: Images.profile, title: "contact_us".tr),
                  ProfileMenuItemWidget(onTap: (){
                    Get.toNamed(RouteHelper.getPolicyRoute(PolicyEnum.privacyPolicy));
                  },
                      icon: Images.profile, title: "privacy_policy".tr),
                  ProfileMenuItemWidget(
                    onTap: (){
                      Get.toNamed(RouteHelper.getPolicyRoute(PolicyEnum.termsOfService));
                    },
                      icon: Images.profile, title: "terms_and_condition".tr),
                  ProfileMenuItemWidget(icon: Images.delete, title: "delete_account".tr),
                  ProfileMenuItemWidget(icon: Images.logout, title: "logout".tr,
                    onTap: (){
                      Get.find<AuthenticationController>().clearSharedData();
                      Get.offAllNamed(RouteHelper.getSignInRoute());
                    },),

                ],
                ),
              );
            }
        ),)
      ]),
    );
  }
}

class MoreMenuItemWidget extends StatelessWidget {
  final String? icon;
  final String title;
  final Color? color;
  final Function()? onTap;
  const MoreMenuItemWidget({super.key, this.icon, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap, showShadow: false,
      child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        child: Column(spacing: Dimensions.paddingSizeSmall, children: [
          CustomContainer(showShadow: false,
              borderRadius: 123, color: systemPrimaryColor().withValues(alpha: .125),
              width: 60,child: Image.asset(icon?? Images.profile, color: systemPrimaryColor())),
          Text(title, style: textRegular.copyWith(color: color)),
        ]),
      ),
    );
  }
}
