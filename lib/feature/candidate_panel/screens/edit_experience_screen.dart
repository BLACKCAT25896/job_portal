import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:job/util/dimensions.dart';

class EditExperienceScreen extends StatelessWidget {
  const EditExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"experience".tr, actions: [

    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateExperienceWidget(),
          ))
        ]));
  }
}
