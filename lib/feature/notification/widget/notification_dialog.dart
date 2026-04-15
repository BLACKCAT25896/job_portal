import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/notification/domain/model/push_notification_model.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';

import 'package:flutter/material.dart';
import 'package:mighty_job/util/styles.dart';

class NotificationDialog extends StatelessWidget {
  final PushNotificationModel notificationModel;
  const NotificationDialog({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusSmall))),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child:  SizedBox(width: 600,
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [

            Align(alignment: Alignment.centerRight,
              child: IconButton(icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop())),


              (notificationModel.data!.image != null && notificationModel.data!.image!.isNotEmpty) ?
              Container(width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                    color: systemPrimaryColor().withValues(alpha: 0.20)),

                child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: CustomImage(image: '${AppConstants.imageBaseUrl}/${notificationModel.data!.image}',
                    width: MediaQuery.of(context).size.width, fit: BoxFit.contain)),
              ) : const SizedBox(),
              SizedBox(height: (notificationModel.data!.image != null && notificationModel.data!.image!.isNotEmpty)
                  ? Dimensions.paddingSizeLarge : 0),

              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                child: Text(notificationModel.data!.title!,
                  textAlign: TextAlign.center,
                  style: textMedium.copyWith(color: systemPrimaryColor(),
                    fontSize: Dimensions.fontSizeLarge))),

              Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text(notificationModel.data!.description!,
                  textAlign: TextAlign.start,
                  style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
