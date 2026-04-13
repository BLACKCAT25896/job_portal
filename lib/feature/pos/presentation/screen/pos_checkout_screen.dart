import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_right_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosCheckoutScreen extends StatefulWidget {
  const PosCheckoutScreen({super.key});

  @override
  State<PosCheckoutScreen> createState() => _PosCheckoutScreenState();
}

class _PosCheckoutScreenState extends State<PosCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "pos".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: PosRightSectionWidget())
      ],),
    );
  }
}
