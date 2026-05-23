import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/candidate_panel/screens/edit_personal_details_screen.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"personal_details".tr, actions: [
      IconButton(onPressed: (){
        Get.to(()=> EditPersonalDetailsScreen());
      }, icon: CustomImage(image:Images.edit, isLocalAsset: true,
        height: 25, svgColor: Colors.white))
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Column(children: [
          CandidatePersonalDetailsWidget()
        ]),
      ))
    ]));
  }
}
