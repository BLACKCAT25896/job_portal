import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_model.dart';
import 'package:job/feature/candidate_training/presentation/widgets/add_new_candidate_training_widget.dart';
import 'package:job/util/dimensions.dart';

class EditTrainingScreen extends StatefulWidget {
  final CandidateTrainingItem? candidateTrainingItem;
  const EditTrainingScreen({super.key, this.candidateTrainingItem});

  @override
  State<EditTrainingScreen> createState() => _EditTrainingScreenState();
}

class _EditTrainingScreenState extends State<EditTrainingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"training".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateTrainingWidget(candidateTrainingItem: widget.candidateTrainingItem),
          ))
        ]));
  }
}
