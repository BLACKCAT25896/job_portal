import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/util/dimensions.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const CustomBottomSheet({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.only(bottom: 40, top: 15),
      decoration: BoxDecoration(color: backgroundColor?? Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.paddingSizeDefault))),
      width: Get.width,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 40,height: 4,decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withValues(alpha:.5), borderRadius: BorderRadius.circular(20)),),
        const SizedBox(height: 15,),
        Expanded(child: child)
      ],),
    );
  }
}
