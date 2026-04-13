
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/model/order_status_model.dart';
import 'package:ecommerce/feature/order_management/order_status/logic/order_status_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateNewOrderStatusWidget extends StatefulWidget {
  final OrderStatusItem? orderStatusItem;
  const CreateNewOrderStatusWidget({super.key, this.orderStatusItem, });

  @override
  State<CreateNewOrderStatusWidget> createState() => _CreateNewOrderStatusWidgetState();
}

class _CreateNewOrderStatusWidgetState extends State<CreateNewOrderStatusWidget> {
  TextEditingController nameController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.orderStatusItem != null){
      nameController.text = widget.orderStatusItem?.name??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(spacing: Dimensions.paddingSizeDefault,
        mainAxisSize: MainAxisSize.min, children: [
      CustomTextField(
        controller: nameController,
        title: "name".tr, hintText: "name".tr,),
      CustomButton(onTap: (){
        String name = nameController.text.trim();

        if(name.isEmpty){
          showCustomSnackBar("name_is_empty".tr);
        }else{
          Get.find<OrderStatusController>().createOrderStatus(name);
        }
      }, text: "confirm".tr)
    ]);
  }
}
