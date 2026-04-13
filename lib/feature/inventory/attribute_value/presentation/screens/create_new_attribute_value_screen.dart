import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/create_new_attribute_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAttributeValueScreen extends StatefulWidget {
  final AttributeValueItem? attributeValueItem;
  const CreateNewAttributeValueScreen({super.key, this.attributeValueItem});

  @override
  State<CreateNewAttributeValueScreen> createState() => _CreateNewAttributeValueScreenState();
}

class _CreateNewAttributeValueScreenState extends State<CreateNewAttributeValueScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: widget.attributeValueItem != null?
      "update_attribute_value".tr : "create_new_attribute_value".tr,),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: CreateNewAttributeValueWidget(
            attributeValueItem: widget.attributeValueItem))
      ],),
    );
  }
}
