import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/styles.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()=> Get.back(), child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.arrow_back_ios, size: 13, color: Theme.of(context).hintColor),
        Text("back".tr, style: textRegular.copyWith(color: Theme.of(context).textTheme.displayLarge?.color),),
      ],
    ));
  }
}
