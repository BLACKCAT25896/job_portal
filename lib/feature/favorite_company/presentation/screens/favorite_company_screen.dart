
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/favorite_company/controller/favorite_company_controller.dart';
import 'package:mighty_job/feature/favorite_company/presentation/widgets/favorite_company_list_widget.dart';

class FavoriteCompanyScreen extends StatefulWidget {
  const FavoriteCompanyScreen({super.key});

  @override
  State<FavoriteCompanyScreen> createState() => _FavoriteCompanyScreenState();
}

class _FavoriteCompanyScreenState extends State<FavoriteCompanyScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "favorite_company".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<FavoriteCompanyController>().getFavoriteCompanyList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: FavoriteCompanyListWidget(scrollController: scrollController))
        ],),
      ),
    );
  }
}



