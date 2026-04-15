import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/feature/inventory/warehouse/presentation/widgets/create_new_warehouse_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewWarehouseScreen extends StatefulWidget {

  const CreateNewWarehouseScreen({super.key});

  @override
  State<CreateNewWarehouseScreen> createState() => _CreateNewWarehouseScreenState();
}

class _CreateNewWarehouseScreenState extends State<CreateNewWarehouseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_warehouse".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "product_management".tr,
              pathItems: ["add_new_warehouse".tr],),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: CreateNewWarehouseWidget(),
            ),
          ],
        ),)
      ],),
    );
  }
}
