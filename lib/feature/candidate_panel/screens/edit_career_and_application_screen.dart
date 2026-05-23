import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_panel/widgets/edit_career_and_application_informaton.dart';
import 'package:job/util/dimensions.dart';

class EditCareerAndApplicationScreen extends StatelessWidget {
  const EditCareerAndApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"career_and_application".tr, actions: [
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: EditCareenAndApplicationWidget(),
      ))
    ]));
  }
}
