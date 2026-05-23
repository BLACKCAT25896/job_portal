import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_links/presentation/widgets/candidate_link_list_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_links_screen.dart';
import 'package:job/util/dimensions.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({super.key});

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"links".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateLinkListWidget(scrollController: scrollController),
          ))
        ]), floatingActionButton: CustomFloatingButton(onTap: (){
        Get.to(()=> EditLinksScreen());
      }),);
  }
}
