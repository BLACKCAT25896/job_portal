
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/profile/presentation/widgets/password_update_widget.dart';
import 'package:job/feature/profile/presentation/widgets/profile_information_widget.dart';
import 'package:job/util/dimensions.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BaseLayout(scrollController: scrollController,
        child: GetBuilder<CandidatePanelController>(builder: (controller) {
          return Center(child: SizedBox(width: Dimensions.webMaxWidth,
            child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: Column(spacing: Dimensions.paddingSizeDefault, children: [

                ProfileInformationWidget(),
                PasswordUpdateWidget()
              ])),
          ));
        }
        )),
    );
  }
}


