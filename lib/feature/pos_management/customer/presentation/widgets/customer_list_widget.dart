import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/create_new_customer_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/customer_item_widget.dart';

class CustomerListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CustomerListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      initState: (val) => Get.find<CustomerController>().getCustomer(1),
      builder: (controller) {
        final model = controller.customerModel;
        final data = model?.data;

        return GenericListSection<CustomerItem>(
          sectionTitle: "customer".tr,
          addNewTitle: "add_new_customer".tr,
          onAddNewTap: () => showDialog(context: context, builder: (_) => Dialog(child: const CreateNewCustomerWidget()),),
          headings: const ["name", "phone",'address'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getCustomer(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => CustomerItemWidget(index: index, customerItem: item),
        );
      },
    );
  }
}


