import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? leftPadding;
  final Widget? widget;
  final Widget? subWidget;
  final bool webTitle;
  final Color? color;
  const CustomTitle({super.key, required this.title,  this.isRequired = false, this.fontSize, this.widget, this.fontWeight, this.leftPadding, this.webTitle = false, this.subWidget, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        Row(children: [
              Padding(padding:  EdgeInsets.only(left: leftPadding??0),
                child: ResponsiveHelper.isDesktop(context)?
                Padding(padding:  EdgeInsets.only(left: leftPadding?? Dimensions.paddingSizeDefault),
                  child: Text(title.tr, style: textMedium.copyWith(fontSize: fontSize?? Dimensions.fontSizeExtraLarge))):
                Text(title.tr, style: textRegular.copyWith(fontSize: fontSize?? Dimensions.fontSizeDefault,
                    color : color,
                    fontWeight: fontWeight))
              ),
              if(isRequired)
                Text('*',style: textSemiBold.copyWith( fontSize: Dimensions.fontSizeDefault, color: Colors.red)),
              if(subWidget!=null)
                Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: subWidget!,
                )
            ]),

        Spacer(),
        widget??SizedBox()
      ],
    );
  }
}
class CustomSubTitle extends StatelessWidget {
  final String title;
  const CustomSubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title.tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).textTheme.bodyMedium?.color),);
  }
}