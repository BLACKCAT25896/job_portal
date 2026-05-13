
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/feature/profile/presentation/widgets/profile_info_widget.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/util/dimensions.dart';

class CandidateBaseLayout extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;

  const CandidateBaseLayout({
    super.key,
    required this.child,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
        child: GetBuilder<SideBarController>(builder: (controller) {
          return Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeDefault, children: [
              CustomContainer(width: 250,
                child: Column(children: [
                  ProfileInfoWidget(),
                  CustomDivider(),
                  SingleChildScrollView(
                    child: Column(children: [
                      ...controller.candidateSideMenuItems,
                    ]),
                  ),
                ]),
              ),
              Expanded(child: child),
            ]),
          );
          }),
        ),
      ),
    );
  }
}