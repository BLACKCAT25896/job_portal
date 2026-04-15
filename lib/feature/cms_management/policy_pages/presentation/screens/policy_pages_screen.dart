
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/presentation/widgets/pages_list_widget.dart';

class PolicyPagesScreen extends StatefulWidget {
  const PolicyPagesScreen({super.key});

  @override
  State<PolicyPagesScreen> createState() => _PolicyPagesScreenState();
}

class _PolicyPagesScreenState extends State<PolicyPagesScreen> {
  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "pages".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: PagesListWidget(scrollController: scrollController))
      ]),
    );
  }
}
