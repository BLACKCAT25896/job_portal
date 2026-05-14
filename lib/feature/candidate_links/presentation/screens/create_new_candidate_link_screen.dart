import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_model.dart';
import 'package:job/feature/candidate_links/presentation/widgets/add_new_candidate_link_widget.dart';

class CreateNewCandidateLinkScreen extends StatefulWidget {
  final CandidateLinkItem? candidateLinkItem;
  const CreateNewCandidateLinkScreen({super.key, this.candidateLinkItem});

  @override
  State<CreateNewCandidateLinkScreen> createState() => _CreateNewCandidateLinkScreenState();
}

class _CreateNewCandidateLinkScreenState extends State<CreateNewCandidateLinkScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_link".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateLinkWidget(candidateLinkItem: widget.candidateLinkItem),)]));
  }
}
