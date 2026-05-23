import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_panel/screens/edit_refference_screen.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/candidate_reference_list_widget.dart';
import 'package:job/util/dimensions.dart';

class ReferenceScreen extends StatefulWidget {
  const ReferenceScreen({super.key});

  @override
  State<ReferenceScreen> createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"reference".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateReferenceListWidget(scrollController: scrollController),
          ))
        ]), floatingActionButton: CustomFloatingButton(onTap: (){
        Get.to(()=> EditReferenceScreen());
      }),);
  }
}
