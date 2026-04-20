import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';

class PublicIndustryItemWidget extends StatelessWidget {
  final IndustryItem? industryItem;
  final int index;
  const PublicIndustryItemWidget({super.key,  required this.index, this.industryItem});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: industryItem?.name??'')),
    ]);
  }
}