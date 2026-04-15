
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:mighty_job/feature/ownership_type/presentation/screens/create_new_ownership_type_screen.dart';
import 'package:mighty_job/feature/ownership_type/presentation/widgets/ownership_type_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnershipTypeScreen extends StatefulWidget {
  const OwnershipTypeScreen({super.key});

  @override
  State<OwnershipTypeScreen> createState() => _OwnershipTypeScreenState();
}

class _OwnershipTypeScreenState extends State<OwnershipTypeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "ownership_type".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<OwnershipTypeController>().getOwnershipTypeList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: OwnershipTypeListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_ownership_type".tr,
              onTap: () =>  Get.to(()=> const CreateNewOwnershipTypeScreen())),
    );
  }
}



