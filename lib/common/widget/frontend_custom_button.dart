import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/util/styles.dart';

enum IconPosition { left, right }

class FrontendCustomButton extends StatelessWidget {
  const FrontendCustomButton({
    super.key, required this.onTap, required this.text, this.textColor =  Colors.white,
    this.height = 40, this.width = double.infinity, this.borderRadius = 15, this.showTextOnly = false,
    this.fontSize = 14, this.fontWeight = FontWeight.w500, this.icon, this.buttonColor,
    this.showBorderOnly = false, this.borderColor, this.textUnderline = false, this.boxShadow,
    this.buttonContentPosition = MainAxisAlignment.center, this.innerPadding,
    this.iconPosition = IconPosition.left, this.iconToTextSpace = 7, this.borderWidth
  });

  final VoidCallback? onTap;
  final String text;
  final bool showTextOnly;
  final Color textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final MainAxisAlignment buttonContentPosition;
  final double height;
  final double width;
  final double borderRadius;
  final bool showBorderOnly;
  final bool textUnderline;
  final BoxShadow? boxShadow;
  final EdgeInsets? innerPadding;
  final Widget? icon;
  final IconPosition? iconPosition;
  final double? iconToTextSpace;
  final double? borderWidth;
  //Space

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        border: (borderColor == null) ? null : Border.all(
            color: borderColor??Colors.transparent, width: borderWidth?? 1.5,
            strokeAlign: BorderSide.strokeAlignInside),
        color: (showBorderOnly == false) ?  (showTextOnly == false)?
        (buttonColor == null) ? onTap==null? Colors.grey.shade500 :
        systemPrimaryColor() : buttonColor :null : null,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius)),
        boxShadow: boxShadow != null ? [boxShadow!]: null),
      child: Material(color: Colors.transparent,
        child: InkWell(onTap: onTap,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius)),
          child: SizedBox(width: width, height: height,
            child: Padding(padding: innerPadding?? const EdgeInsets.only(left: 10, right: 15),
              child: Row(mainAxisAlignment: buttonContentPosition,
                children: [if(iconPosition == IconPosition.left)...[
                  SizedBox(child: icon,),
                  SizedBox(width: iconToTextSpace)],

                  if (text.isEmpty == false)
                    Flexible(child: FittedBox(child: Text(text, style: landingRegularFont.copyWith(
                              decoration: textUnderline ? TextDecoration.underline : null,
                                color:  textColor,
                                fontSize: fontSize, fontWeight: fontWeight)))
                    ),

                  if(iconPosition == IconPosition.right)...[
                    SizedBox(width: iconToTextSpace,),
                    SizedBox(child: icon,),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
