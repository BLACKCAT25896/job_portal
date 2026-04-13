import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/feature/support_ticket/widgets/support_ticket_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/support_ticket/screens/add_ticket_screen.dart';



class SupportTicketCategoryScreen extends StatefulWidget {
  const SupportTicketCategoryScreen({super.key});
  @override
  State<SupportTicketCategoryScreen> createState() => _SupportTicketCategoryScreenState();
}

class _SupportTicketCategoryScreenState extends State<SupportTicketCategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "support_ticket_category".tr), body: CustomWebScrollView(slivers: [
      SliverToBoxAdapter(child: SupportTicketCategoryListWidget(scrollController: scrollController))
    ]),
        bottomNavigationBar: CustomBottomNavigationButton(title: "add_new_ticket_category".tr, onTap: ()=> Get.to(()=> const AddTicketScreen())));
  }
}



