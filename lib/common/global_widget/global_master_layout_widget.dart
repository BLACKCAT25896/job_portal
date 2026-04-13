import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/header_logo_section.dart';
import 'package:ecommerce/common/global_widget/sidebar_footer_section_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/feature/side_menu/side_menu_controller.dart';
import 'package:ecommerce/helper/responsive_helper.dart';

class GlobalSideMenu extends StatefulWidget {
  final Widget child;
  const GlobalSideMenu({super.key, required this.child});

  @override
  State<GlobalSideMenu> createState() => _GlobalSideMenuState();
}

class _GlobalSideMenuState extends State<GlobalSideMenu> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(
      builder: (controller) {
        final bool isDesktop = ResponsiveHelper.isDesktop(context);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop)
              AnimatedContainer(
                width: controller.isExpanded ? 250 : 0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: controller.isExpanded
                    ? Column(
                  children: [
                    // ---------- FIXED HEADER ----------
                    HeaderLogoSection(),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomSearch(hintText: "search".tr,
                          onSearch: () => controller.filterMenu(searchController.text),
                          onChange: (val) => controller.filterMenu(val), // Auto search
                          reset: () => controller.filterMenu(""),
                          searchController: searchController)
                    ),

                    // ---------- SCROLLABLE MENU ----------
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...controller.sideMenuItems,
                          ],
                        ),
                      ),
                    ),

                    // ---------- FIXED FOOTER ----------
                    SidebarFooterSectionWidget(),
                  ],
                )
                    : null,
              ),

            // Main content
            Expanded(child: widget.child),
          ],
        );
      },
    );
  }
}
