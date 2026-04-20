


import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/text_hover.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class MenuButtonWeb extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Color? color;
  final VoidCallback onTap;

  const MenuButtonWeb({super.key, required this.title, required this.onTap, this.textColor, this.color});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return TextHover(builder: (hovered) {
      return AnimatedScale(scale: hovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,

          child: InkWell(hoverColor: Colors.transparent, splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            onTap: onTap,
            child: Padding(padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeDefault + 4),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(title!, style: landingMediumFont.copyWith(
                    fontSize: Dimensions.fontSizeLarge, color: hovered ? primary : null)),


                AnimatedContainer(duration: const Duration(milliseconds: 200),
                  height: 2, width: hovered ? 50 : 0,
                  decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(4)),),
              ],
              ),
            ),
          ),
        ),
      );
    },
    );
  }
}