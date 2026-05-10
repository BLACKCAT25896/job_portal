import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/feature/profile/presentation/widgets/profile_info_widget.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/util/dimensions.dart';

class CandidateProfileScreen extends StatefulWidget {
  const CandidateProfileScreen({super.key});

  @override
  State<CandidateProfileScreen> createState() => _CandidateProfileScreenState();
}

class _CandidateProfileScreenState extends State<CandidateProfileScreen> {

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseLayout(scrollController: scrollController, child: Center(
        child: SizedBox(width: Dimensions.webMaxWidth,
          child: GetBuilder<SideBarController>(
            builder: (controller) {
              return Row(
                children: [
                  CustomContainer(width: 250, child: Column(children: [
                    ProfileInfoWidget(),
                    CustomDivider(),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ...controller.candidateSideMenuItems,
                        ],
                      ),
                    ),

                  ])),
                  Expanded(child: Container()),
                ],
              );
            }
          ),
        ),
      )),
    );
  }

}


