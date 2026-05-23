import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/candidate_panel/screens/edit_career_and_application_screen.dart';
import 'package:job/feature/candidate_panel/widgets/career_and_application_informaton.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';

class CareerAndApplicationScreen extends StatelessWidget {
  const CareerAndApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"career_and_application".tr, actions: [
      IconButton(onPressed: (){
        Get.to(()=> EditCareerAndApplicationScreen());
      }, icon: CustomImage(image:Images.edit, isLocalAsset: true,
        height: 25, svgColor: Colors.white))
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: CareenAndApplicationWidget(),
      ))
    ]));
  }
}
