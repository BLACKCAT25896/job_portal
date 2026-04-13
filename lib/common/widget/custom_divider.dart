import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final double? verticalPadding;
  const CustomDivider({super.key, this.height = 1, this.color, this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container( color: color??Theme.of(context).hintColor.withValues(alpha: .5),
          width: double.infinity, height: .25),
    );
  }
}