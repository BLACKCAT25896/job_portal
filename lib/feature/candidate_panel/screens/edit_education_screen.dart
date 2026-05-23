import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:job/util/dimensions.dart';

class EditEducationScreen extends StatelessWidget {
  final CandidateEducationItem? candidateEducationItem;
  const EditEducationScreen({super.key, this.candidateEducationItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"education".tr, actions: [

    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateEducationWidget(candidateEducationItem: candidateEducationItem),
          ))
        ]));
  }
}
