import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/custom_add_new_button_widget.dart';
import 'package:ecommerce/common/widget/custom_route_path_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class SectionHeaderWithPath extends StatelessWidget {
  final String sectionTitle;
  final List<String>? pathItems;
  final String? addNewTitle;
  final VoidCallback? onAddNewTap;
  final Widget? subWidget;

  const SectionHeaderWithPath({super.key, required this.sectionTitle,  this.pathItems,  this.addNewTitle,  this.onAddNewTap, this.subWidget,});

  @override
  Widget build(BuildContext context) {
    return (ResponsiveHelper.isDesktop(context))?
    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: CustomRoutePathWidget(title: sectionTitle.tr,
        subWidget: Row(children: [
          if(pathItems != null && pathItems!.isNotEmpty)
            ...pathItems!.map((item) => Padding(padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
              child: PathItemWidget(title: item.tr))),

            if (addNewTitle != null && onAddNewTap != null)
            CustomAddNewButtonWidget(title: addNewTitle!.tr, onTap: onAddNewTap),
          if (subWidget != null)
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: subWidget!,
            ),
          ],
        ),
      ),
    ):const SizedBox();
  }
}
