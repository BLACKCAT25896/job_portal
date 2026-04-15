import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:mighty_job/feature/inventory/brand/presentation/widgets/create_new_brand_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewBrandScreen extends StatefulWidget {
  final BrandItem? brandItem;
  const CreateNewBrandScreen({super.key, this.brandItem});

  @override
  State<CreateNewBrandScreen> createState() => _CreateNewBrandScreenState();
}

class _CreateNewBrandScreenState extends State<CreateNewBrandScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.brandItem != null) {
      update = true;
      nameController.text = widget.brandItem?.name??'';
      descriptionController.text = widget.brandItem?.description??'';
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.brandItem != null? "update_brand".tr : "create_new_brand".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "product_management".tr,
              pathItems: ["create_new_brand".tr],),
            CreateNewBrandWidget(brandItem: widget.brandItem),
          ],
        ))
      ],),
    );
  }
}
