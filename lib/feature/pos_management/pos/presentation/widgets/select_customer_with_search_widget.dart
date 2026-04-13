import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/dropdown_with_search_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/customer_list_for_pos.dart';

class SelectCustomerWithSearchWidget extends StatelessWidget {
  final String? title;
   SelectCustomerWithSearchWidget({super.key, this.title});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (customerController) {
        return DropdownSearch<CustomerItem>(
          sectionTitle: title,
          selectedItem: customerController.selectedCustomerItem,
          itemLabel: (item) => item.name ?? "",
          searchController: searchController,
          onSearch: (val) {
            customerController.getCustomer(1, search: val.trim());
          },
          listWidgetBuilder: () => CustomerListForPosWidget(),
        );
      }
    );
  }
}
