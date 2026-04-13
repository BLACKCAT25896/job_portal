import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/select_attribute_widget.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/attribute_value_item.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/create_new_attribute_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeValueListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const AttributeValueListWidget({super.key, required this.scrollController});

  @override
  State<AttributeValueListWidget> createState() => _AttributeValueListWidgetState();
}

class _AttributeValueListWidgetState extends State<AttributeValueListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeValueController>(builder: (controller) {

      final attributeModel = controller.attributeValueModel;
      final data = attributeModel?.data?.data;

      return GenericListSection<AttributeValueItem>(sectionTitle: "attribute".tr,
          pathItems: ["attribute_value".tr],
          addNewTitle: "add_new_attribute_value".tr,
          subWidget: SizedBox(width: 200, child: SelectAttributeWidget(title: "empty")),
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "attribute_value".tr,
                child: CreateNewAttributeValueWidget()));
          },
          headings: const ["attribute", "value"],
          scrollController: widget.scrollController,
          isLoading: attributeModel == null,
          totalSize: attributeModel?.data?.total ?? 0,
          offset: attributeModel?.data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getAttributeValueList(offset ?? 1,
                Get.find<AttributeController>().selectedAttributeItem?.id??0);
          },

          items: data ?? [],
          itemBuilder: (item, index) {
            return AttributeValueItemWidget(index: index, attributeValueItem: item);
          },);
      },
    );
  }
}
