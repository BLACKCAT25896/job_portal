import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_model.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/add_new_candidate_reference_widget.dart';
import 'package:job/util/dimensions.dart';

class EditReferenceScreen extends StatefulWidget {
  final CandidateReferenceItem? candidateReferenceItem;
  const EditReferenceScreen({super.key, this.candidateReferenceItem});

  @override
  State<EditReferenceScreen> createState() => _EditReferenceScreenState();
}

class _EditReferenceScreenState extends State<EditReferenceScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"reference".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateReferenceWidget(candidateReferenceItem: widget.candidateReferenceItem),
          ))
        ]));
  }
}
