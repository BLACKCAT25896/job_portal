import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/helper/app_color_helper.dart';

class CustomIconTextButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function()? onTap;
  final Color? color;
  final double iconSize;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final bool showShadow;
  final double borderRadius;

  const CustomIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color,
    this.iconSize = 20,
    this.spacing = 4,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    this.showShadow = false,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? systemPrimaryColor();

    return Material(color: Colors.transparent,
      child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(borderRadius),
        child: Container(padding: padding,
          child: Row(mainAxisSize: MainAxisSize.min, children: [

            CustomImage(isLocalAsset: true, width: iconSize, height: iconSize, image: icon, svgColor: c),
              SizedBox(width: spacing),
              Text(text, style: TextStyle(color: c)),
            ],
          ),
        ),
      ),
    );
  }
}

