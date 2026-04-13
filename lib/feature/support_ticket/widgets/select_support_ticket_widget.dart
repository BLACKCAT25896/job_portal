import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:ecommerce/feature/support_ticket/widgets/support_ticket_dropdown_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class SupportTicketCategorySelectionWidget extends StatefulWidget {
  const SupportTicketCategorySelectionWidget({super.key});

  @override
  State<SupportTicketCategorySelectionWidget> createState() => _SupportTicketCategorySelectionWidgetState();
}

class _SupportTicketCategorySelectionWidgetState extends State<SupportTicketCategorySelectionWidget> {
  @override
  void initState() {
    if(Get.find<SupportTicketController>().ticketCategoryModel == null){
      Get.find<SupportTicketController>().getTicketCategoryList();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(
        builder: (ticketCategoryController) {
          return Column(children: [
            const SizedBox(height: Dimensions.paddingSizeSmall),
            CustomTitle(title: "Category", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

            const SizedBox(height: 8,),
            SupportTicketDropdownWidget(width: Get.width, title: "select".tr,
              items: ticketCategoryController.ticketCategoryModel?.data?.data??[],
              selectedValue: ticketCategoryController.selectedTicketCategory,
              onChanged: (val){
                ticketCategoryController.setSelectedTicketCategory(val!);
              },
            ),
          ],);
        }
    );
  }
}
