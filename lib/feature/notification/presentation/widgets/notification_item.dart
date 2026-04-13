import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/notification/domain/model/notification_model.dart';
import 'package:ecommerce/feature/notification/logic/notification_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem? notificationItem;
  final int index;
  const NotificationItemWidget({super.key,  required this.index, this.notificationItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(onTap: (){
          if(notificationItem?.readAt == null){
            Get.find<NotificationController>().getNotificationDetails(notificationItem!.id!);
          }
        }, child: CustomContainer(color: notificationItem?.readAt != null?
        Theme.of(context).cardColor : systemPrimaryColor(),
                width: Get.width, showShadow: false,
                borderRadius: 0, child: Row(spacing: Dimensions.paddingSizeSmall,
                  children: [
                    Text('${index+1}. ', style: textRegular.copyWith(
                      color: notificationItem?.readAt != null?
                      Theme.of(context).textTheme.displayLarge?.color : Theme.of(context).cardColor,
                    ),),
                    Text(notificationItem?.data?.message??'', style: textRegular.copyWith(
                      color: notificationItem?.readAt != null?
                      Theme.of(context).textTheme.displayLarge?.color : Theme.of(context).cardColor,
                    ),),
                  ],
                ))),
        CustomDivider()
      ],
    ) :
    Padding(padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: InkWell(onTap: (){
        if(notificationItem?.readAt == null){
          Get.find<NotificationController>().getNotificationDetails(notificationItem!.id!);
        }


      },
          child: CustomContainer(color: notificationItem?.readAt != null?
          Theme.of(context).cardColor : systemPrimaryColor(),
              borderRadius: 5, child: Text(notificationItem?.data?.message??'',
                style: textRegular.copyWith(
                color: notificationItem?.readAt != null?
                Theme.of(context).textTheme.displayLarge?.color : Theme.of(context).cardColor,
              ),))),
    );
  }
}