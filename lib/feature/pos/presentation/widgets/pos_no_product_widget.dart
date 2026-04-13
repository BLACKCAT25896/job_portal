import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PosNoProductWidget extends StatelessWidget {
  const PosNoProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.only(top :MediaQuery.of(context).size.height / 20),
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.1),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(Images.logo, width: 50, height: 50),
              Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Text("scan_item_or_add_from_item".tr,
                  style: textRegular.copyWith(color: Theme.of(context).hintColor),
                  textAlign: TextAlign.center,)),

            ]),
      ),
    );
  }
}
