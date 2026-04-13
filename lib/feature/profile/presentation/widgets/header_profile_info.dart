import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/profile/domain/model/profile_model.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class HeaderProfileInfo extends StatelessWidget {
  const HeaderProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        initState: (val) {
          if(Get.find<ProfileController>().profileModel == null) {
            Get.find<ProfileController>().getProfileInfo();
          }
        },
        builder: (profileController) {
          ProfileModel? profile = profileController.profileModel;

          return CustomContainer(borderRadius: 120, verticalPadding: 4, horizontalPadding: 7,
            showShadow: false, color: Theme.of(context).hintColor.withValues(alpha: .125),
            child: Row(spacing: Dimensions.paddingSizeSmall, children: [
              CustomContainer(border: Border.all(width: .125, color: Theme.of(context).hintColor), showShadow: false, horizontalPadding: 0, verticalPadding: 0, borderRadius: 120,
                  child: const CustomImage(width: 30,height: 30,radius: 120,)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(profile?.data?.name??'No Name', style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault )),
                  Icon(Icons.keyboard_arrow_down, size: 20, color: Theme.of(context).hintColor)
                ],
                ),
              ])
            ]),
          );
        }
    );
  }
}
