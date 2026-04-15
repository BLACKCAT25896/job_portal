import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/feature/side_menu/side_menu_controller.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';

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

class SquareButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  final int count;
  final bool hasCount;
  final bool isWallet;
  final double? balance;
  final bool isLoyalty;
  final String? subTitle;

  const SquareButton({super.key, required this.image,
    required this.title, required this.navigateTo, required this.count,
    required this.hasCount, this.isWallet = false, this.balance, this.subTitle,
    this.isLoyalty = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => navigateTo)),
      child: Column(children: [
        Padding(padding: const EdgeInsets.all(8.0),
          child: Container(width: 120, height: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ?
                systemPrimaryColor().withValues(alpha: .30) : systemPrimaryColor()),
            child: Stack(children: [
              Positioned(top: -80,left: -10,right: -10,
                  child: Container(height: 120, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withValues(alpha: .07), width: 15),
                      borderRadius: BorderRadius.circular(100)))),


              isWallet?
              Padding(padding: const EdgeInsets.all(8.0),
                child: SizedBox(width: 30, height: 30,child: Image.asset(image, color: Colors.white)),
              ):

              Center(child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: Image.asset(image, color: Theme.of(context).hintColor))),

            ],
            ),
          ),
        ),
        Text(title??'', maxLines: 1,overflow: TextOverflow.clip,
            style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).textTheme.bodyLarge?.color)),
      ]),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  final bool isNotification;
  final bool isProfile;
  const TitleButton({super.key, required this.image, required this.title, required this.navigateTo,  this.isNotification = false, this.isProfile = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Image.asset(image, width: 25, height: 25, fit: BoxFit.fill, color: systemPrimaryColor().withValues(alpha: .6),),
      title: Text(title!, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => navigateTo),
      ),
    );
  }
}

