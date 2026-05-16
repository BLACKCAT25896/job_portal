import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/layout/section_header_with_path_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/profile/presentation/widgets/password_update_widget.dart';
import 'package:job/util/dimensions.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "change_password".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "change_password".tr),
            const PasswordUpdateWidget()
          ]),
        ))
      ]),
    );
  }
}


class CompanyPasswordChangeScreen extends StatefulWidget {
  const CompanyPasswordChangeScreen({super.key});

  @override
  State<CompanyPasswordChangeScreen> createState() => _CompanyPasswordChangeScreenState();
}

class _CompanyPasswordChangeScreenState extends State<CompanyPasswordChangeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "change_password".tr),
      body: BaseLayout(scrollController: scrollController,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(children: [
              SectionHeaderWithPath(sectionTitle: "change_password".tr),
              const PasswordUpdateWidget()
            ]),
          )),
    );
  }
}
