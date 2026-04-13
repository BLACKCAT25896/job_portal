import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/side_menu/src/side_bar_controller.dart';
import 'package:ecommerce/util/styles.dart';

class SideMenuItemWidget extends StatelessWidget {
  final String title;
  final String keyValue;
  final VoidCallback onTap;
  final String? icon;

  const SideMenuItemWidget({super.key, required this.title, required this.keyValue,
    required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SidebarController>(builder: (controller) {
      final bool selected = controller.isActive(keyValue);


      return InkWell(onTap: () {
          controller.onNestedTap(keyValue);
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(children: [
              Icon(Icons.arrow_right_alt, color: selected ? systemPrimaryColor() :
              Theme.of(context).dividerColor,),
              Expanded(child: Text(title,
                style: textRegular.copyWith(color: selected ? systemPrimaryColor() :
                Theme.of(context).textTheme.displayLarge?.color,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
