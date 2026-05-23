import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_panel/widgets/edit_candidate_personal_details_widget.dart';
import 'package:job/util/dimensions.dart';

class EditPersonalDetailsScreen extends StatelessWidget {
  const EditPersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"personal_details".tr, actions: [

    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
            child: EditCandidatePersonalDetailsWidget(),
          )
        ]),
      ))
    ]));
  }
}
