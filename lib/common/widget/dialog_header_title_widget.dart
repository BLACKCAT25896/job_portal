import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class DialogHeaderTitleWidget extends StatelessWidget {
  final String? title;
  const DialogHeaderTitleWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        Expanded(child: Text(title??"", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
        IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.clear, color: Theme.of(context).hintColor))

      ],
    );
  }
}
