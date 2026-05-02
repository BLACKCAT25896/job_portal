import 'package:flutter/material.dart';

class InfoRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final double fontSize;

  const InfoRichText({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$label: ",
            style: labelStyle ??
                TextStyle(
                  fontSize: fontSize,
                  color: theme.hintColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: value,
            style: valueStyle ??
                TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}