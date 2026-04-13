
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/theme_controller.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/role_model.dart';
import 'package:ecommerce/feature/role_and_permission/role/presentation/screens/create_new_role_screen.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class RoleItemWidget extends StatelessWidget {
  final RoleItem? roleItem;
  final int index;
  const RoleItemWidget({super.key, this.roleItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    ExpansionTile(backgroundColor: Theme.of(context).cardColor,
      dense: true, tilePadding: EdgeInsets.zero,
      title: Row(spacing: Dimensions.paddingSizeDefault, children: [
        NumberingWidget(index: index),
        Expanded(child: Text("${roleItem?.name}",
          style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
        InkWell(onTap: (){
          Get.to(()=> CreateNewRoleScreen(roleItem: roleItem));
        },
            child: SizedBox(width: 15, child: Image.asset(Images.edit,
                color: Theme.of(context).hintColor))),
      ],
      ),
      children: [
        if(roleItem!.permissions != null && roleItem!.permissions!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(direction: Axis.horizontal, alignment : WrapAlignment.start,
              children: [for (int index =0; index < roleItem!.permissions!.length; index++)
                Padding(padding:  const EdgeInsets.symmetric(vertical: 5),
                  child: Container(decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: Get.find<ThemeController>().darkTheme? Colors.grey.withValues(alpha: 0.2):
                      systemPrimaryColor().withValues(alpha: .1)),
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall-3,
                        horizontal: Dimensions.paddingSizeSmall),
                    margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.85),
                      child: Row(mainAxisSize:MainAxisSize.min,children: [
                        Flexible(child: Text(roleItem?.permissions?[index].name??'',
                            style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
                            overflow: TextOverflow.ellipsis)),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
      ],):
    CustomContainer(horizontalPadding: 0, verticalPadding: 0,
        child: ExpansionTile(
          title: Row(children: [
              Expanded(child: Text("${roleItem?.name}",
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              InkWell(onTap: (){
                Get.to(()=> CreateNewRoleScreen(roleItem: roleItem));
              },
                  child: SizedBox(width: 15, child: Image.asset(Images.edit))),
            ],
          ),
        children: [
          if(roleItem!.permissions != null && roleItem!.permissions!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(direction: Axis.horizontal, alignment : WrapAlignment.start,
              children: [for (int index =0; index < roleItem!.permissions!.length; index++)
                Padding(padding:  const EdgeInsets.symmetric(vertical: 5),
                  child: Container(decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: Get.find<ThemeController>().darkTheme?
                      Colors.grey.withValues(alpha: 0.2): systemPrimaryColor().withValues(alpha: .1)),
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall-3,
                        horizontal: Dimensions.paddingSizeSmall),
                    margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.85),
                      child: Row(mainAxisSize:MainAxisSize.min,children: [
                        Flexible(child: Text(roleItem?.permissions?[index].name??'',
                            style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
                            overflow: TextOverflow.ellipsis)),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],));
  }
}