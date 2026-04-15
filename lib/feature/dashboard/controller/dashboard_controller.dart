import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/model/popup_menu_model.dart';
import 'package:ecommerce/feature/dashboard/model/navigation_model.dart';
import 'package:ecommerce/feature/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/feature/side_menu/presentation/more_screen.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/images.dart';

class DashboardController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;

  void resetNavBar() {
    _currentTab = 0;
  }

  void setTabIndex(int index, {bool notify = true}) {
    _currentTab = index;
    if(!ResponsiveHelper.isDesktop(Get.context!) && notify) {
      update();
    }
  }

  final ScrollController scrollController = ScrollController();

  final List<NavigationModel> item = [
    NavigationModel(name: 'home', activeIcon: Images.home, inactiveIcon: Images.home,
        screen: const HomeScreen()),
    NavigationModel(name: 'pos', activeIcon: Images.posIcon,
        inactiveIcon: Images.posIcon, screen: const SizedBox()),
    NavigationModel(name: 'product', activeIcon: Images.product,
        inactiveIcon: Images.product, screen: const SizedBox()),
    NavigationModel(name: 'more', activeIcon: Images.more,
        inactiveIcon: Images.more, screen: const MoreScreen()),
  ];



  List<PopupMenuModel> getPopupMenuList({bool subscription = false,
    bool approve = false, bool editDelete = false,
    bool sendSms = false, bool supportTicket = false,
    bool product = false, bool institute = false}) {
    if(editDelete){
      return [
        PopupMenuModel(title: "edit".tr, icon: Icons.edit),
        PopupMenuModel(title: "delete".tr, icon: Icons.delete_forever),
      ];

    }else if(supportTicket){
      return [
        PopupMenuModel(title: "view".tr, icon: Icons.remove_red_eye_rounded),
        PopupMenuModel(title: "close".tr, icon: Icons.clear),
      ];

    }else if(approve){
      return [
        PopupMenuModel(title: "approve".tr, icon: Icons.check),
        PopupMenuModel(title: "decline".tr, icon: Icons.clear),
      ];

    }else if(sendSms){
      return [
        PopupMenuModel(title: "send_sms".tr, icon: Icons.send),
        PopupMenuModel(title: "decline".tr, icon: Icons.clear),
      ];

    }else if(subscription){
      return [
        PopupMenuModel(title: "subscription_upgrade_request".tr, icon: Icons.request_quote),
        PopupMenuModel(title: "payment".tr, icon: Icons.payment),
      ];

    } else if(product){
      return [
        PopupMenuModel(title: "view".tr, icon: Icons.remove_red_eye_outlined),
        PopupMenuModel(title: "barcode".tr, icon: Icons.qr_code),
        PopupMenuModel(title: "edit".tr, icon: Icons.edit),
        PopupMenuModel(title: "delete".tr, icon: Icons.delete_forever),
      ];

    }else if(institute){
      return [
        PopupMenuModel(title: "upgrade_subscription".tr, icon: Icons.update),

      ];

    }else {
      return [
        PopupMenuModel(title: "edit".tr, icon: Icons.edit),
        PopupMenuModel(title: "delete".tr, icon: Icons.delete_forever),
      ];
    }

  }
}
