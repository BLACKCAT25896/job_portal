import 'package:flutter/material.dart';
import 'package:job/helper/app_color_helper.dart';

class GradientDivider extends StatelessWidget {
  final Color? color;
  const GradientDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.transparent,
          color?? systemPrimaryColor().withValues(alpha: 0.3),
          Colors.transparent,
        ]),
      ),
    );
  }
}