import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/header_profile_info.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/styles.dart';


class HeaderProfileInfoMenu extends StatefulWidget {
  const HeaderProfileInfoMenu({super.key});

  @override
  State<HeaderProfileInfoMenu> createState() => _HeaderProfileInfoMenuState();
}

class _HeaderProfileInfoMenuState extends State<HeaderProfileInfoMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: const HeaderProfileInfo(),
          items: [
            ...MenuItems.firstItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
            const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
            ...MenuItems.secondItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
          ],
          onChanged: (value) {
            MenuItems.onChanged(context, value! as MenuItem);
          },
          buttonStyleData: ButtonStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40))),
          dropdownStyleData: DropdownStyleData(width: 160,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                color: systemPrimaryColor()),
            offset: const Offset(40, -4) ),
          menuItemStyleData: MenuItemStyleData(
            customHeights: [
              ...List<double>.filled(MenuItems.firstItems.length, 48),
              8,
              ...List<double>.filled(MenuItems.secondItems.length, 48),
            ],
            padding: const EdgeInsets.only(left: 16, right: 16),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
    required this.id,
  });

  final String text;
  final IconData icon;
  final String id;
}

class MenuItems {
  static List<MenuItem> firstItems = [
    MenuItem(text: 'profile'.tr, icon: Icons.person, id: 'profile')
  ];
  static List<MenuItem> secondItems = [
    MenuItem(text: 'logout'.tr, icon: Icons.exit_to_app, id: 'logout')
  ];

  static Widget buildItem(MenuItem item) {
    return Row(children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(width: 10),
        Expanded(child: Text(item.text, style:  textRegular.copyWith(color: Colors.white))),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item.id) {
      case 'profile':
        Get.toNamed(RouteHelper.getProfileRoute());
        break;
      case 'logout':
        Get.find<AuthenticationController>().clearSharedData();
        Get.offAllNamed(RouteHelper.getSignInRoute());
        break;
    }
  }
}