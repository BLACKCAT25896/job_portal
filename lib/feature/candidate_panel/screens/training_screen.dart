import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_panel/screens/edit_training_screen.dart';
import 'package:job/feature/candidate_training/presentation/widgets/candidate_training_list_widget.dart';
import 'package:job/util/dimensions.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"training".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateTrainingListWidget(scrollController: scrollController),
          ))
        ]), floatingActionButton: CustomFloatingButton(onTap: (){
        Get.to(()=> EditTrainingScreen());
      }),);
  }
}
