import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:ecommerce/feature/support_ticket/widgets/add_ticket_widget.dart';
import 'package:ecommerce/feature/support_ticket/widgets/support_ticket_item_widget.dart';

class SupportTicketListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const SupportTicketListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(
      initState: (state) => Get.find<SupportTicketController>().getTicketList(1),
      builder: (controller) {
        final model = controller.supportTicketModel;
        final data = model?.data;

        return GenericListSection(
          sectionTitle: "support_ticket".tr,
          pathItems: [ "ticket".tr],
          addNewTitle: "add_new_ticket".tr,
          onAddNewTap: () => Get.dialog(
            CustomDialogWidget(title: "ticket".tr,
                child: const AddTicketWidget())),
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 1,
          onPaginate: (offset) async => await controller.getTicketList(offset ?? 1),
          headings: const [ "topic", "ticket_status", "date"],
          items: data?.data ?? [],
          itemBuilder: (ticket, index) => SupportTicketItemWidget(supportTicketModel: ticket, index: index),
        );
      },
    );
  }
}
