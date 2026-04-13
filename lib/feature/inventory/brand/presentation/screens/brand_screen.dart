
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_bottom_navigation_button.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/screens/create_new_brand_screen.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/widgets/brand_list_widget.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {


  TextEditingController searchController =  TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<BrandController>().getBrandList(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "brands".tr),

      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<BrandController>().getBrandList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: BrandListWidget(scrollController: scrollController))
        ],),
      ),

      
      bottomNavigationBar: (Get.find<ProfileController>().hasPermission("brand-create"))?
          CustomBottomNavigationButton(title: "create_new_brand",
              onTap: ()=> Get.to(()=> const CreateNewBrandScreen()))
       : const SizedBox(),
    );
  }
}



