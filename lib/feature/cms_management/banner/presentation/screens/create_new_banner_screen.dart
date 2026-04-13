import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/web_app_bar.dart';
import 'package:ecommerce/feature/cms_management/banner/presentation/widgets/create_new_banner_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewBannerScreen extends StatefulWidget {
  const CreateNewBannerScreen({super.key});

  @override
  State<CreateNewBannerScreen> createState() => _CreateNewBannerScreenState();
}

class _CreateNewBannerScreenState extends State<CreateNewBannerScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context)? null : CustomAppBar(title: "banner".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        if(ResponsiveHelper.isDesktop(context))
          SliverAppBar(automaticallyImplyLeading: false, title: WebAppBar(), titleSpacing: 0, pinned: true, toolbarHeight: 60, elevation: 5,),
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CreateNewBannerWidget(),
          ),
        ),)
      ],),
    );
  }
}
