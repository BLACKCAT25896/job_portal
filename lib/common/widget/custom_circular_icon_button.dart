import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';

class CustomCircularIconButton extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;
  const CustomCircularIconButton({super.key, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(onTap: onTap,
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(120),
            color: Theme.of(context).cardColor.withValues(alpha:.15)),
          padding: const EdgeInsets.all(Dimensions.paddingSizeSeven),
          child: Icon(iconData, color: Colors.white, size: 18),),
      ),
    );
  }
}
