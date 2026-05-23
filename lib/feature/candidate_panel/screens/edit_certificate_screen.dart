import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_model.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/add_new_candidate_certificate_widget.dart';
import 'package:job/util/dimensions.dart';

class EditCertificateScreen extends StatefulWidget {
  final CandidateCertificateItem? candidateCertificateItem;
  const EditCertificateScreen({super.key, this.candidateCertificateItem});

  @override
  State<EditCertificateScreen> createState() => _EditCertificateScreenState();
}

class _EditCertificateScreenState extends State<EditCertificateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"certificate".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: AddNewCandidateCertificateWidget(candidateCertificateItem: widget.candidateCertificateItem),
          ))
        ]));
  }
}
