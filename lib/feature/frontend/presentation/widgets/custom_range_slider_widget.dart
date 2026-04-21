import 'package:flutter/material.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CustomRangeSlider extends StatelessWidget {
  final RangeValues values;
  final String title;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<RangeValues> onChanged;

  const CustomRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    required this.title,
    this.min = 0,
    this.max = 100,
    this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    // 🔥 safety clamp (prevents UI crashes)
    final safeValues = RangeValues(
      values.start.clamp(min, max),
      values.end.clamp(min, max),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: textSemiBold.copyWith(
            fontSize: Dimensions.fontSizeDefault,
          ),
        ),

        const SizedBox(height: 6),

        RangeSlider(
            values: safeValues,
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              safeValues.start.round().toString(),
              safeValues.end.round().toString(),
            ),
            onChanged: (newValues) {
              // 🔥 enforce valid ordering
              final corrected = RangeValues(
                newValues.start < min ? min : newValues.start,
                newValues.end > max ? max : newValues.end,
              );

              onChanged(corrected);
            },
          ),
      ],
    );
  }
}