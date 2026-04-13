
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/screens/create_new_attribute_value_screen.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/attribute_value_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeValueScreen extends StatefulWidget {
  const AttributeValueScreen({super.key});

  @override
  State<AttributeValueScreen> createState() => _AttributeValueScreenState();
}

class _AttributeValueScreenState extends State<AttributeValueScreen> {
  TextEditingController searchController =  TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<AttributeValueController>().getAttributeValueList(1,
        Get.find<AttributeController>().selectedAttributeItem?.id??0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "attribute_value".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<AttributeValueController>().getAttributeValueList(1,
              Get.find<AttributeController>().selectedAttributeItem?.id??0);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: AttributeValueListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar:
          CustomBottomNavigationButton(title: "create_new_attribute",
              onTap: ()=> Get.to(()=> const CreateNewAttributeValueScreen())),
    );
  }
}



