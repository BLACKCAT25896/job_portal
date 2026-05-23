import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/candidate_panel/screens/edit_relevant_information_screen.dart';
import 'package:job/feature/candidate_panel/widgets/relevant_information_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';

class RelevantInformationScreen extends StatelessWidget {
  const RelevantInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"relevant_information".tr, actions: [
      IconButton(onPressed: (){
        Get.to(()=> EditRelevantInformationScreen());
      }, icon: CustomImage(image:Images.edit, isLocalAsset: true,
        height: 25, svgColor: Colors.white))
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: RelevantInformationWidget(),
      ))
    ]));
  }
}
