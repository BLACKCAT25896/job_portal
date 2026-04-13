import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/cart/presentation/widget/pos_cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosCartListWidget extends StatelessWidget {
  const PosCartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
        final selectedItems = cartController.selectedItems;
        return ListView.separated(
          itemCount: selectedItems.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            final item = selectedItems[index];
            return PosCartItemWidget(item: item, index: index);
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(thickness: .1, height: .2);
        },);
      }
    );
  }
}
