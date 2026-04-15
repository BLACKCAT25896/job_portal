import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/language/presentation/screens/select_language_bottom_sheet.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "select_language".tr),
      body : CustomWebScrollView(slivers : [
        SliverToBoxAdapter(child: Column(children: [
          SectionHeaderWithPath(sectionTitle: "general_settings".tr, pathItems: ["language_setting".tr]),
          SelectLanguageBottomSheet()
        ]))

      ]));
  }
}
