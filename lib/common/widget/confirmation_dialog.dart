import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Function() onTap;
  final Function()? onTapWithSync;
  final bool backup;
  final bool action;
  const ConfirmationDialog({super.key, this.title, this.content, required this.onTap,
    this.backup = false, this.onTapWithSync, this.action = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.all(25),
      content: Stack(children: [
          Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeSmall ,children: [

              if(action)...[
                Text(title??'', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge)),
                Text(content??'',textAlign: TextAlign.center, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
              ]else...[
                Text("${title?.tr}!!!", textAlign: TextAlign.center, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                Text(content??"${"are_you_sure".tr} ${title?.tr}",textAlign: TextAlign.center, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),

              ],

              if(onTapWithSync != null)
              CustomButton(onTap: () => Get.back(), text: "sync_logout".tr,
                showBorderOnly: true, textColor: Theme.of(context).colorScheme.error, borderColor: Theme.of(context).colorScheme.error,height: 35,),


              Row(spacing: Dimensions.paddingSizeSmall,mainAxisAlignment: MainAxisAlignment.end, children: [


                SizedBox(width: 120,child: CustomButton(onTap: onTap, text: "confirm".tr)),
              ],)
            ],),
          ),
          Positioned(top: 0,right: 0,
              child: IconButton(onPressed: ()=>  Get.back(),
                  icon: Icon(Icons.close, color: Theme.of(context).hintColor)))
        ],
      ),);
  }
}