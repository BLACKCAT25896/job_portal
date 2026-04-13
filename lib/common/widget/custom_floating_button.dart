import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';


class CustomFloatingButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final IconData? icon;
  final bool cart;
  const CustomFloatingButton({super.key,  this.title, this.onTap, this.icon, this.cart = false});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)? SizedBox() :
    FloatingActionButton.extended(backgroundColor: systemPrimaryColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      onPressed: onTap,
      label: GetBuilder<CartController>(builder: (controller) {
          return Row(spacing: Dimensions.paddingSizeSmall, children: [
            (cart)?
            Badge(label : Text(controller.selectedItems.length.toString()),
                child: Icon(icon?? Icons.add)):

            Icon(icon?? Icons.add),

            Text(title?.tr?? "add".tr, style: textRegular.copyWith(),)
          ],);
        }
      ),);
  }
}
