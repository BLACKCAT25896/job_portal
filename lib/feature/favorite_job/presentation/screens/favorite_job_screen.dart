
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/favorite_job/controller/favorite_job_controller.dart';
import 'package:mighty_job/feature/favorite_job/presentation/widgets/Favorite_job_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavoriteJobScreen extends StatefulWidget {
  const FavoriteJobScreen({super.key});

  @override
  State<FavoriteJobScreen> createState() => _FavoriteJobScreenState();
}

class _FavoriteJobScreenState extends State<FavoriteJobScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "favorite_job".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<FavoriteJobController>().getFavoriteJobList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: FavoriteJobListWidget(scrollController: scrollController))
        ],),
      ),
    );
  }
}



