import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/add_product_widget.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  final String? id;
  const AddProductScreen({super.key, this.id});
  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> with TickerProviderStateMixin {

  bool update = false;
  @override
  void initState() {
    if(Get.find<CategoryController>().categoryModel == null){
      Get.find<CategoryController>().getCategoryList(1);
    }
    if(Get.find<BrandController>().brandModel == null){
      Get.find<BrandController>().getBrandList(1);
    }

    if(Get.find<UnitController>().unitModel == null){
      Get.find<UnitController>().getUnit(1);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: CustomAppBar(
       title: widget.id !=null? "update_product".tr :
       "add_product".tr, actions: [IconButton(onPressed: (){
         Get.find<ProductController>().clearData();
       },
           icon: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Container(decoration: BoxDecoration(
               color: Theme.of(context).colorScheme.error,
             borderRadius: BorderRadius.circular(55), ),
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                 child: Text("clear".tr, style: textRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),)),
           ))],),

       body: CustomWebScrollView(slivers: [
         SliverToBoxAdapter(child: Column(children: [
             SectionHeaderWithPath(sectionTitle: "product_management".tr, pathItems: ["add_product"],),
             Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                 child: AddProductWidget(id: widget.id),
               ),
           ],
         ),
        )
      ],),
     );
  }


}
