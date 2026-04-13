
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_setting_widget.dart';

class PosSettingScreen extends StatefulWidget {
  const PosSettingScreen({super.key});

  @override
  State<PosSettingScreen> createState() => _PosSettingScreenState();
}

class _PosSettingScreenState extends State<PosSettingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "pos_setting".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: Column(
            children: [
              SectionHeaderWithPath(sectionTitle: 'pos_settings'.tr),
              PosSettingWidget(),
            ],
          ),)
        ],),

    );
  }
}



