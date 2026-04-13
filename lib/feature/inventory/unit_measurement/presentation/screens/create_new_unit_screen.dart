import 'package:ecommerce/feature/inventory/unit_measurement/presentation/widgets/create_new_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewUnitScreen extends StatefulWidget {

  const CreateNewUnitScreen({super.key});

  @override
  State<CreateNewUnitScreen> createState() => _CreateNewUnitScreenState();
}

class _CreateNewUnitScreenState extends State<CreateNewUnitScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_unit".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewUnitWidget(),
        ),)
      ],),
    );
  }
}
