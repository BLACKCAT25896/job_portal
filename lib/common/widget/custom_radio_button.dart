import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class HorizontalRadioSelector<T> extends StatelessWidget {
  final List<RadioOption<T>> options;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;

  const HorizontalRadioSelector({super.key, required this.options,
    required this.selectedValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: options.map((option) {
        final isSelected = selectedValue == option.value;
        return GestureDetector(onTap: () => onChanged(option.value),
          child: CustomContainer(color: isSelected ? systemPrimaryColor().withValues(alpha: .1) :
          Theme.of(context).hintColor.withValues(alpha: .1),
            verticalPadding: 0, horizontalPadding: 0, showShadow: false, borderRadius: 3,
            child: Row(children: [
              SizedBox(width: 10),
              RadioGroup(onChanged: onChanged, groupValue: selectedValue,
                child: Text(option.label, style: textRegular.copyWith()),)

              ])),
        );
      }).toList(),
    );
  }
}

class RadioOption<T> {
  final String label;
  final T value;
  RadioOption({required this.label, required this.value});
}
