import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/customer_item_for_pos_widget.dart';

class CustomerListForPosWidget extends StatelessWidget {
  const CustomerListForPosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      initState: (val) => Get.find<CustomerController>().getCustomer(1),
      builder: (controller) {
        final model = controller.customerModel;
        final data = model?.data?.data ?? [];

        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final customer = data[index];
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(onTap: () {
                Get.back();
                controller.setSelectCustomerItem(customer);
              },
                child: CustomerItemForPosWidget(index: index, customerItem: customer)),
            );
          },
          separatorBuilder: (_, __) => const CustomDivider(),
        );
      },
    );
  }
}
