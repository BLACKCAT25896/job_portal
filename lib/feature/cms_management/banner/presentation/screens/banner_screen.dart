import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/cms_management/banner/presentation/widgets/banner_list_widget.dart';
import 'package:mighty_job/feature/cms_management/banner/presentation/widgets/create_new_banner_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "banners".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [

        SliverToBoxAdapter(child: BannerListWidget(scrollController: scrollController),)
      ],),
      floatingActionButton:

      CustomFloatingButton(onTap: (){
        Get.dialog(Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(width: Get.width,
              child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: CreateNewBannerWidget(),
              ),
            )));
      },),
    );
  }
}
