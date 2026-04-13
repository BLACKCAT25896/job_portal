import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/create_new_attribute_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAttributeScreen extends StatefulWidget {
  final AttributeItem? attributeItem;
  const CreateNewAttributeScreen({super.key, this.attributeItem});

  @override
  State<CreateNewAttributeScreen> createState() => _CreateNewAttributeScreenState();
}

class _CreateNewAttributeScreenState extends State<CreateNewAttributeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: widget.attributeItem != null?
      "update_attribute".tr : "create_new_attribute".tr,),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: CreateNewAttributeWidget(
            attributeItem: widget.attributeItem))
      ],),
    );
  }
}
