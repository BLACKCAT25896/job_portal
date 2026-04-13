import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/feature/support_ticket/widgets/support_ticket_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/support_ticket/screens/add_ticket_screen.dart';



class SupportTicketScreen extends StatefulWidget {
  const SupportTicketScreen({super.key});
  @override
  State<SupportTicketScreen> createState() => _SupportTicketScreenState();
}

class _SupportTicketScreenState extends State<SupportTicketScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "support_ticket".tr), body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: SupportTicketListWidget(scrollController: scrollController))
      ]),
      bottomNavigationBar: CustomBottomNavigationButton(title: "add_new_ticket".tr,
          onTap: ()=> Get.to(()=> const AddTicketScreen())));
  }
}



