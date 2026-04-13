
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/screens/create_new_attribute_screen.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/attribute_list_widget.dart';
import 'package:ecommerce/helper/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeScreen extends StatefulWidget {
  const AttributeScreen({super.key});

  @override
  State<AttributeScreen> createState() => _AttributeScreenState();
}

class _AttributeScreenState extends State<AttributeScreen> {
  TextEditingController searchController =  TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<AttributeController>().getAttributeList(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "attribute".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<AttributeController>().getAttributeList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: AttributeListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar: (isPermitted("attribute-create"))?
          CustomBottomNavigationButton(title: "create_new_attribute",
              onTap: ()=> Get.to(()=> const CreateNewAttributeScreen()))
       : const SizedBox(),
    );
  }
}



