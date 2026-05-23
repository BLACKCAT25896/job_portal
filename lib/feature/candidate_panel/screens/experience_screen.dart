import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/candidate_experience_list_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_experience_screen.dart';
import 'package:job/util/dimensions.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"experience".tr),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateExperienceListWidget(scrollController: scrollController),
          ))
        ]),  floatingActionButton: CustomFloatingButton(onTap: (){
          Get.to(()=> EditExperienceScreen());
        }));
  }
}
