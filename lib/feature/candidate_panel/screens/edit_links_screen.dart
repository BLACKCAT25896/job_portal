import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_model.dart';
import 'package:job/feature/candidate_links/presentation/widgets/add_new_candidate_link_widget.dart';
import 'package:job/util/dimensions.dart';

class EditLinksScreen extends StatefulWidget {
  final CandidateLinkItem? candidateLinkItem;
  const EditLinksScreen({super.key, this.candidateLinkItem});

  @override
  State<EditLinksScreen> createState() => _EditLinksScreenState();
}

class _EditLinksScreenState extends State<EditLinksScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"links".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateLinkWidget(candidateLinkItem: widget.candidateLinkItem),
          ))
        ]));
  }
}
