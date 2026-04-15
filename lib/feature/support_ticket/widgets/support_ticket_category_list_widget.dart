import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/feature/support_ticket/widgets/add_new_ticket_catyegory_widget.dart';
import 'package:mighty_job/feature/support_ticket/widgets/support_ticket_category_item_widget.dart';

class SupportTicketCategoryListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const SupportTicketCategoryListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(
      initState: (state) => Get.find<SupportTicketController>().getTicketCategoryList(),
      builder: (controller) {
        final model = controller.ticketCategoryModel;
        final data = model?.data;

        return GenericListSection(
          sectionTitle: "support_ticket".tr,
          pathItems: [ "ticket_category".tr],
          addNewTitle: "add_new_ticket_category".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "ticket_category".tr,
              child: const AddTicketCategoryWidget())),
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 1,
          onPaginate: (offset) async => await controller.getTicketCategoryList(),
          headings: const ["title", "description"],
          items: data?.data ?? [],
          itemBuilder: (ticketCategory, index) => SupportTicketCategoryItemWidget( index: index, categoryItem: ticketCategory,),
        );
      },
    );
  }
}
