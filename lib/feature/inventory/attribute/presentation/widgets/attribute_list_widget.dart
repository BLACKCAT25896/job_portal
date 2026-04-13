import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/attribute_item.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/create_new_attribute_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const AttributeListWidget({super.key, required this.scrollController});

  @override
  State<AttributeListWidget> createState() => _AttributeListWidgetState();
}

class _AttributeListWidgetState extends State<AttributeListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttributeController>(initState: (_) {
        Get.find<AttributeController>().getAttributeList(1);
      }, builder: (controller) {

      final attributeModel = controller.attributeModel;
      final data = attributeModel?.data?.data;

      return GenericListSection<AttributeItem>(sectionTitle: "attributes".tr,

        topWidget: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,0 ,
            Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault),
          child: CustomSearch(hintText: "search".tr,
            searchController: searchController,
            onChange: (String query) async {
              if (query.trim().isEmpty) {
                Get.snackbar("Error", "empty_search".tr);
              } else {
                await controller.getAttributeList(1, search: query.trim());
              }
            },),
          ),
          pathItems: ["attributes".tr],
          addNewTitle: "create_new_attribute".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "attributes".tr,
                child: CreateNewAttributeWidget()));
          },
          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: attributeModel == null,
          totalSize: attributeModel?.data?.total ?? 0,
          offset: attributeModel?.data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getAttributeList(offset ?? 1);
          },

          items: data ?? [],
          itemBuilder: (item, index) {
            return AttributeItemWidget(index: index, attributeItem: item);
          },);
      },
    );
  }
}
