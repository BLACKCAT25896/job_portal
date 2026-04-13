import 'dart:developer';

import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void showCustomSnackBar(String? message, {bool isError = true, double margin = Dimensions.paddingSizeSmall}) {

  if(message != null && message.isNotEmpty) {
    if(ResponsiveHelper.isDesktop(Get.context!)){
      toastification.show(
        context: Get.context!,
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        autoCloseDuration: const Duration(seconds: 2),
        title: Text(message, maxLines: 2, style: textRegular,),
        alignment: Alignment.topRight,
        direction: TextDirection.ltr,
        animationDuration: const Duration(milliseconds: 300),
        animationBuilder: (context, animation, alignment, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        icon: Icon(isError? Icons.clear : Icons.check),
        showIcon: true, // show or hide the icon
        primaryColor: isError ? Colors.red : Colors.green,
        backgroundColor: isError ? Colors.red : Colors.green,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(5),
        showProgressBar: true,
        closeOnClick: false,
        pauseOnHover: true,
        dragToClose: true,
        applyBlurEffect: true,
        callbacks: ToastificationCallbacks(
          onTap: (toastItem) => log('Toast ${toastItem.id} tapped'),
          onCloseButtonTap: (toastItem) => log('Toast ${toastItem.id} close button tapped'),
          onAutoCompleteCompleted: (toastItem) => log('Toast ${toastItem.id} auto complete completed'),
          onDismissed: (toastItem) => Get.back(),
        ),
      );
    }else{
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: isError ? Colors.red : Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}