import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/route_controller.dart';
import 'package:mighty_job/common/global_widget/global_master_layout_widget.dart';

class SidebarReactiveWrapper extends StatelessWidget {
  final Widget child;
  const SidebarReactiveWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final routeController = Get.find<RouteController>();

    return Obx(() {
      final currentRoute = routeController.currentRoute.value;
      final noSidebarRoutes = [
        // RouteHelper.pos,
        // RouteHelper.initial,
        ""
      ];

      final shouldShowSidebar = !noSidebarRoutes.contains(currentRoute);

      return Scaffold(
        body: shouldShowSidebar
            ? GlobalSideMenu(child: child)
            : child,
      );
    });
  }
}
