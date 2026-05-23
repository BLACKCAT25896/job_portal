import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_education/presentation/widgets/candidate_education_list_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_education_screen.dart';
import 'package:job/util/dimensions.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"education".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateEducationListWidget(scrollController: scrollController),
          ))
        ]), floatingActionButton: CustomFloatingButton(onTap: (){
        Get.to(()=> EditEducationScreen());
      }),);
  }
}
