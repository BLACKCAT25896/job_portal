import 'package:job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/side_menu/side_menu_controller.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "more".tr),
      body: GetBuilder<SideBarController>(
        initState: (value){
          if(Get.find<ProfileController>().profileModel == null){
            Get.find<ProfileController>().getProfileInfo();
          }
        },
        builder: (controller) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Expanded(child: SingleChildScrollView(
              child: Column(children: [
                    ...controller.sideMenuItems,
                  ],
                ),
              ),
            ),

            ListTile(leading: SizedBox(width: 30, child: Image.asset(Images.logout,
              color: systemPrimaryColor(),)),
              title: Text("logout".tr, style: textRegular.copyWith()),
              onTap: (){
              Get.find<AuthenticationController>().clearSharedData();
              Get.offAllNamed(RouteHelper.getSignInRoute());

              },
            ),

          ]);
        }
      ),
    );
  }
}

