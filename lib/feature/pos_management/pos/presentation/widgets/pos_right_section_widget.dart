import 'package:ecommerce/feature/payment_method/presentation/widgets/select_payment_method_widget.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/cart/presentation/widget/pos_cart_widget.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/select_customer_with_search_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/screens/create_new_user_screen.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';

class PosRightSectionWidget extends StatefulWidget {
  const PosRightSectionWidget({super.key});

  @override
  State<PosRightSectionWidget> createState() => _PosRightSectionWidgetState();
}

class _PosRightSectionWidgetState extends State<PosRightSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(showShadow: false,borderRadius: 0,
      child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.end, spacing: Dimensions.paddingSizeSmall, children: [
              Expanded(child: SelectCustomerWithSearchWidget()),
            CustomContainer(
              onTap: ()=> Get.dialog(CreateNewUserScreen()),
              color: systemPrimaryColor(), showShadow: false, borderRadius: 5,
              child: CustomImage(image: Images.userAdd, width: 20, isLocalAsset: true),)
            ],
          ),

        SelectPaymentMethodWidget(),
        PosCartWidget()
        ],
      ),
    );
  }
}
