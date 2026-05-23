import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/candidate_certificate_list_widget.dart';
import 'package:job/feature/candidate_panel/screens/edit_certificate_screen.dart';
import 'package:job/util/dimensions.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"certificate".tr, actions: [
    ]),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CandidateCertificateListWidget(scrollController: scrollController),
          ))
        ]), floatingActionButton: CustomFloatingButton(onTap: (){
        Get.to(()=> EditCertificateScreen());
      }),);
  }
}
