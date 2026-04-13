import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/feature/support_ticket/widgets/add_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({super.key});
  @override
  AddTicketScreenState createState() => AddTicketScreenState();
}

class AddTicketScreenState extends State<AddTicketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_ticket".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: AddTicketWidget())
      ]),

    );
  }
}
