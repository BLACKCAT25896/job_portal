
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_model.dart';
import 'package:ecommerce/feature/inventory/category/presentation/widgets/add_new_category_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewCategoryScreen extends StatefulWidget {
  final CategoryItem? categoryItem;
  const CreateNewCategoryScreen({super.key, this.categoryItem});

  @override
  State<CreateNewCategoryScreen> createState() => _CreateNewCategoryScreenState();
}

class _CreateNewCategoryScreenState extends State<CreateNewCategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "category".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "product_management".tr,
              pathItems: ["add_new_category".tr]),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewCategoryWidget(categoryItem: widget.categoryItem),
            ),
          ],
        ))
      ],),
    );
  }
}
