
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/gradient_divider_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/screens/address_details_screen.dart';
import 'package:job/feature/candidate_panel/screens/career_and_application_screen.dart';
import 'package:job/feature/candidate_panel/screens/certificate_screen.dart';
import 'package:job/feature/candidate_panel/screens/education_screen.dart';
import 'package:job/feature/candidate_panel/screens/experience_screen.dart';
import 'package:job/feature/candidate_panel/screens/links_screen.dart';
import 'package:job/feature/candidate_panel/screens/personal_details_screen.dart';
import 'package:job/feature/candidate_panel/screens/refference_screen.dart';
import 'package:job/feature/candidate_panel/screens/relevant_information_screen.dart';
import 'package:job/feature/candidate_panel/screens/training_screen.dart';
import 'package:job/feature/candidate_panel/screens/upload_photo_screen.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CandidateProfileMobileScreen extends StatefulWidget {
  const CandidateProfileMobileScreen({super.key});

  @override
  State<CandidateProfileMobileScreen> createState() => _CandidateProfileMobileScreenState();
}

class _CandidateProfileMobileScreenState extends State<CandidateProfileMobileScreen> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().getCandidateProfileInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "profile".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: GetBuilder<CandidatePanelController>(builder: (controller) {
          return Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomContainer(borderRadius: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeDefault, children: [

                Text("personal_information".tr, style: textRegular),
                    ProfileMenuItemWidget( title :"upload_photo".tr, onTap: (){
                      Get.to(()=> UploadPhotoScreen());
                    }, icon: Images.camera),
                    ProfileMenuItemWidget( title :"personal_details".tr, onTap: (){
                      Get.to(()=> PersonalDetailsScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"contact_details".tr, onTap: (){
                      Get.to(()=> AddressDetailsScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"career_and_application".tr, onTap: (){
                      Get.to(()=> CareerAndApplicationScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"relevant_information".tr, onTap: (){
                      Get.to(()=> RelevantInformationScreen());
                    }, icon: Images.profile),

                    GradientDivider(),
                    Text("education_and_training".tr, style: textRegular),


                    ProfileMenuItemWidget( title :"education".tr, onTap: (){
                      Get.to(()=> EducationScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"training".tr, onTap: (){
                      Get.to(()=> TrainingScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"certificate".tr, onTap: (){
                      Get.to(()=> CertificateScreen());
                    }, icon: Images.profile),

                    GradientDivider(),
                    Text("employment".tr, style: textRegular),
                    ProfileMenuItemWidget( title :"employment_history".tr, onTap: (){
                      Get.to(()=> ExperienceScreen());
                    }, icon: Images.profile),

                    GradientDivider(),
                    Text("other_information".tr, style: textRegular),
                    ProfileMenuItemWidget( title :"reference".tr, onTap: (){
                      Get.to(()=> ReferenceScreen());
                    }, icon: Images.profile),
                    ProfileMenuItemWidget( title :"links".tr, onTap: (){
                      Get.to(()=> LinksScreen());
                    }, icon: Images.profile),



              ]),
            ),
          ]);
        }
        ),)
      ]),
    );
  }

}


