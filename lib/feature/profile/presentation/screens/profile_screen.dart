import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/section_header_with_path_widget.dart';
import 'package:job/common/widget/image_picker_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/profile/presentation/widgets/password_update_widget.dart';
import 'package:job/feature/profile/presentation/widgets/profile_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomWebScrollView(slivers: [
       SliverToBoxAdapter(child: Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
         child: Column(spacing: Dimensions.paddingSizeDefault, children: [

           SectionHeaderWithPath(sectionTitle: "profile".tr),

           GetBuilder<ProfileController>(builder: (controller) {
             final model = controller.profileModel;
             final avatar = model?.data?.image;
             return ImagePickerWidget(pickedFile: controller.profileAvatar,
                   imageUrl: avatar != null? "${AppConstants.imageBaseUrl}/users/$avatar" : "",
                   onImagePicked: ()=> controller.pickImage());
             }),


           ProfileInformationWidget(),
           PasswordUpdateWidget()
         ]),
       ))

      ]),
    );
  }
}

