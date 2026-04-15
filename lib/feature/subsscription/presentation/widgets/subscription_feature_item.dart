import 'package:mighty_job/common/widget/custom_divider.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:get/get.dart';

class SubscriptionFeatureItem extends StatelessWidget {
  final String title;
  final bool first;
  final bool second;
  final bool third;

  const SubscriptionFeatureItem({super.key, required this.title, required this.first, required this.second, required this.third});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: Dimensions.paddingSizeSmall, children: [
        Padding(padding: const EdgeInsets.only(right: 50),
          child: Row(spacing: 120, children: [
            Expanded(child: Text(title.tr, style: textMedium)),
            Icon(first? Icons.check : Icons.clear, color: first? Colors.green : Colors.red),
            Icon(second? Icons.check : Icons.clear, color: second? Colors.green : Colors.red),
            Icon(third? Icons.check : Icons.clear, color: third? Colors.green : Colors.red),

          ]),
        ),
        CustomDivider()
      ],
    );
  }
}
