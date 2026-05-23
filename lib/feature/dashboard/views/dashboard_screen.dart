
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/animated_custom_dialog.dart';
import 'package:job/common/widget/confirmation_dialog_widget.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/dashboard/controller/dashboard_controller.dart';
import 'package:job/feature/dashboard/model/navigation_model.dart';
import 'package:job/feature/dashboard/widget/custom_menu_item.dart';
import 'package:job/feature/home/presentation/screens/web_home_screen.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/images.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {

  final PageStorageBucket bucket = PageStorageBucket();


  @override
  void initState() {
    Get.find<DashboardController>().setTabIndex(0, notify: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return PopScope(canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) async {
        _onWillPop(context);
        return;
      },
      child: GetBuilder<DashboardController>(builder: (menuController) {
        return GetBuilder<AuthenticationController>(
          builder: (controller) {
            String userType = controller.getUserType();
            log("===UserType==> $userType");
            return Scaffold(resizeToAvoidBottomInset: false,
              body: isDesktop? const WebHomeScreen() :
              PageStorage(bucket: bucket,
                  child: userType == "Candidate"?
                  menuController.candidateItem[menuController.currentTab].screen:
                  menuController.item[menuController.currentTab].screen
              ),

              bottomNavigationBar: isDesktop? const SizedBox() :
              Container(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [BoxShadow(offset: const Offset(1,1),
                      blurRadius: 2, spreadRadius: 1, color: Theme.of(context).hintColor)]),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateBottomNavigationItems(menuController,
                        userType == "Candidate"? menuController.candidateItem:
                        menuController.item)),
              ),
            );
          }
        );
      }),
    );
  }

  List<Widget> generateBottomNavigationItems(
      DashboardController menuController, List<NavigationModel> item) {

    List<Widget> items = [];
    for(int index = 0; index < item.length; index++) {
      items.add(Expanded(child: CustomMenuItem(
        isSelected: menuController.currentTab == index,
        name: item[index].name.tr,
        activeIcon: item[index].activeIcon,
        inActiveIcon: item[index].inactiveIcon,
        onTap: () => menuController.setTabIndex(index),
      )));
    }
    return items;
  }



}
Future<bool> _onWillPop(BuildContext context) async {
  if (kIsWeb) {
    return true;
  } else {
    showAnimatedDialog(context,
      ConfirmationDialogWidget(
        icon: Images.logo,
        title: 'exit_app'.tr,
        description: 'do_you_want_to_exit_the_app'.tr,
        onYesPressed: () {
          SystemNavigator.pop();
        },
      ),
      isFlip: true,
    );
    return false;
  }
}

