import 'package:ecommerce/common/widget/custom_circular_icon_button.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String? title;
  final bool showAction;
  final bool centerTitle;
  final bool pined;
  final Widget? widget;
  const CustomSliverAppbar({super.key, this.title, this.showAction = true,
    this.centerTitle = false,  this.pined = false, this.widget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(floating: true, elevation: 1,
        centerTitle: centerTitle,
        pinned: pined,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: pined, backgroundColor:  systemPrimaryColor(),
        toolbarHeight: 70,
        leading: centerTitle ? CustomCircularIconButton(iconData: CupertinoIcons.arrow_left,
            onTap: ()=> Get.back()) : null,


        title: title != null? Text("${title?.tr}", style: textMedium.copyWith(
            color: Colors.white, fontSize: Dimensions.fontSizeDefault)) :
        GetBuilder<ProfileController>(
            builder: (profileController) {
              return Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: InkWell( splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                      child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(children: [
                          SizedBox(height: 20, child: Image.asset(Images.logo)),
                          const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                          Flexible(child: Text('default',
                              maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: textRegular.copyWith(color: Colors.white,
                                  fontSize: Dimensions.fontSizeSmall))),
                          const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                          const Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: Colors.white),
                        ],),
                      ),
                    ),
                  ),
                  SizedBox(),
                ],
              );
            }
        ), actions:  showAction? const [] : [
          widget??const SizedBox(),

        ]);
  }
}
