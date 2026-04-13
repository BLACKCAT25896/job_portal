import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class UserItemWidgetForFilter extends StatelessWidget {
  final UserItem? userItem;
  final int index;
  const UserItemWidgetForFilter({super.key, this.userItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: '${userItem?.firstName} ${userItem?.lastName?? ''}')),
      Expanded(child: CustomTextItemWidget(text: userItem?.email?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.phone?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.address?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.userType?? 'N/A')),
    ],
    );
  }
}