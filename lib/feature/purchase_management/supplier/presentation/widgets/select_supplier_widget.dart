import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/dropdown_with_search_widget.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/supplier_list_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectSupplierWidget extends StatefulWidget {
  const SelectSupplierWidget({super.key});

  @override
  State<SelectSupplierWidget> createState() => _SelectSupplierWidgetState();
}

class _SelectSupplierWidgetState extends State<SelectSupplierWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
        CustomTitle(title: "supplier", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

        GetBuilder<SupplierController>(initState: (_) {
            if (Get.find<SupplierController>().supplierModel == null) {
              Get.find<SupplierController>().getSupplier(1);
            }
          },
          builder: (supplierController) {
            return DropdownSearch<SupplierItem>(
              selectedItem: supplierController.selectedSupplierItem,
              itemLabel: (item) => item.name ?? "",
              searchController: searchController,
              onSearch: (val) {
                supplierController.getSupplier(1, search: val.trim());
              },
              listWidgetBuilder: () => SingleChildScrollView(
                  child: SupplierListWidget(fromFilter: true,
                      scrollController: scrollController)),
            );
          },
        ),
      ],
    );
  }
}
