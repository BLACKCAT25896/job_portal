import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/profile/domain/model/profile_model.dart';
import 'package:ecommerce/feature/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class ProfileInfoWidget extends StatelessWidget {
  final ProfileModel? profileModel;
  const ProfileInfoWidget({super.key, this.profileModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.fromLTRB(
        Dimensions.paddingSizeDefault,0,Dimensions.paddingSizeDefault,
        Dimensions.paddingSizeSmall),
      child: CustomContainer(borderRadius: 5, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(decoration : BoxDecoration(borderRadius: BorderRadius.circular(120),
              color: systemPrimaryColor().withValues(alpha:.15),
              border: Border.all()),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: ClipRRect(borderRadius: BorderRadius.circular(120),
                child: const CustomImage(width: 40, height: 40, isLocalAsset: true,
                    image: Images.profile)),
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profileModel?.data?.name?.capitalize??'',
                  style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Text(profileModel?.data?.subscription?.package?.packageType??'',
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
              InkWell(onTap: ()=> Get.to(()=> const ProfileScreen()),
                child: Row(children: [
                    Text("edit_profile".tr, style: textRegular.copyWith(
                        color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    Icon(Icons.arrow_forward_ios_rounded, size: 13,
                        color: Theme.of(context).hintColor),
                  ],
                ),
              ),
            ],
          )),
          InkWell(onTap: ()=> Get.to(()=> const ProfileScreen()),
              child: SizedBox(width: 25, child: Image.asset(Images.edit,
                  color: Get.isDarkMode? Colors.white : Colors.black))),
        ],),

        Padding(
          padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault,
              bottom: Dimensions.paddingSizeSmall),
          child: Row(children: [
            Expanded(child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    border: Border.all(width: .15)),
                alignment: Alignment.center,

                child: Text('Mirpur Branch', maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: textMedium,))),
            const SizedBox(width: Dimensions.paddingSizeSmall,),

            Expanded(child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    border: Border.all(width: .15)),
                alignment: Alignment.center,

                child: Text(profileModel?.data?.phone??'', style: textMedium,))),
            //Text(profileModel?.data?.email??''),
          ],
          ),
        ),

      ])),
    );
  }
}
