
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/feature/notification/presentation/widgets/notification_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/notification/logic/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "notifications".tr),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<NotificationController>().getNotificationList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: NotificationListWidget(scrollController: scrollController))
        ],),
      ),

    );
  }
}

