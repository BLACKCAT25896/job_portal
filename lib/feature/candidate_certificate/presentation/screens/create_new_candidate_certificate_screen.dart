import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_model.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/add_new_candidate_certificate_widget.dart';

class CreateNewCandidateCertificateScreen extends StatefulWidget {
  final CandidateCertificateItem? candidateCertificateItem;
  const CreateNewCandidateCertificateScreen({super.key, this.candidateCertificateItem});

  @override
  State<CreateNewCandidateCertificateScreen> createState() => _CreateNewCandidateCertificateScreenState();
}

class _CreateNewCandidateCertificateScreenState extends State<CreateNewCandidateCertificateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_certificate".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateCertificateWidget(candidateCertificateItem: widget.candidateCertificateItem),)]));
  }
}
