import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.all(systemPrimaryColor()),
      activeTrackColor: systemPrimaryColor(),
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Theme.of(context).hintColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
