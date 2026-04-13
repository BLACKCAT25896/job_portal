
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/model/order_type_model.dart';
import 'package:ecommerce/feature/order_management/order_type/logic/order_type_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateNewOrderTypeWidget extends StatefulWidget {
  final OrderTypeItem? orderTypeItem;
  const CreateNewOrderTypeWidget({super.key, this.orderTypeItem, });

  @override
  State<CreateNewOrderTypeWidget> createState() => _CreateNewOrderTypeWidgetState();
}

class _CreateNewOrderTypeWidgetState extends State<CreateNewOrderTypeWidget> {
  TextEditingController nameController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.orderTypeItem != null){
      nameController.text = widget.orderTypeItem?.name??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(spacing: Dimensions.paddingSizeDefault,mainAxisSize: MainAxisSize.min, children: [
      CustomTextField(
        controller: nameController,
        title: "name".tr, hintText: "name".tr,),
      CustomButton(onTap: (){
        String name = nameController.text.trim();

        if(name.isEmpty){
          showCustomSnackBar("name_is_empty".tr);
        }else{
          Get.find<OrderTypeController>().createOrderType(name);
        }
      }, text: "confirm".tr)
    ]);
  }
}
