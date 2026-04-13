
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_dropdown.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/enum/action_type.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/inventory/damage/controller/damage_controller.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_body.dart';
import 'package:ecommerce/feature/inventory/product/logic/search_product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/add_product_section_title.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_selection_for_action_widget.dart';
import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:ecommerce/feature/inventory/warehouse/presentation/widgets/select_warehouse_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDamageScreen extends StatefulWidget {
  final ProductActionType actionType;
  const CreateDamageScreen({super.key, required this.actionType});

  @override
  State<CreateDamageScreen> createState() => _CreateDamageScreenState();
}

class _CreateDamageScreenState extends State<CreateDamageScreen> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_damage".tr, onBackPress: (){
        Get.find<SearchProductController>().removeAllProduct();
        Get.back();
      },),

      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "product_management".tr,
              pathItems: ["new_damage".tr]),
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: GetBuilder<DamageController>(builder: (damageController) {
                return GetBuilder<SearchProductController>(builder: (searchProductController) {
                  return CustomContainer(showShadow: false,
                    child: Column(spacing: Dimensions.paddingSizeDefault,
                      mainAxisSize: MainAxisSize.min, children: [


                        Row(spacing: Dimensions.paddingSizeDefault, children: [
                          Expanded(child: Column(children: [
                            const SizedBox(width: Dimensions.paddingSizeSmall),
                            AddProductSectionTitle(title: "reason".tr),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: CustomDropdown(width: Get.width, title: "select".tr,
                                items: damageController.damageTypes,
                                selectedValue: damageController.selectedDamageType,
                                onChanged: (val){
                                  damageController.setSelectedDamageType(val!);
                                },
                              ),),
                          ],)),
                            Expanded(child: SelectWarehouseWidget())
                          ]),



                        ProductSelectionForActionWidget(searchController: searchController,
                            scrollController: scrollController),



                        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                          child: damageController.isLoading? const Center(child: CircularProgressIndicator()):
                          GetBuilder<CartController>(builder: (cartController) {
                            return CustomButton(onTap: (){
                              int? warehouseId = Get.find<WarehouseController>().selectedWarehouseItem?.id;
                              String? date = damageController.formatedDate;
                              String? description = damageController.selectedDamageType;
                              if(cartController.selectedItems.isEmpty){
                                showCustomSnackBar("select_product".tr);
                              }
                              else if(warehouseId == null){
                                showCustomSnackBar("select_warehouse".tr);
                              }
                              else if(description== null){
                                showCustomSnackBar("reason".tr);
                              }
                              else{
                                DamageBody salesBody = DamageBody(
                                  warehouseId: warehouseId,
                                    reportedDate: date,
                                    reason: description,
                                    productItemId: cartController.selectedItems[0].id,
                                    quantity: cartController.selectedItems[0].quantity,
                                    unitCost: cartController.selectedItems[0].variants?.first.price,
                                    productVariantId: cartController.selectedItems[0].id
                                );
                                damageController.createDamage(salesBody);
                              }
                              }, text: "confirm".tr);
                          }))
                      ],),
                  );
                });
              }
              ),
            ),
          ],
        ),)
      ],),
    );
  }
}
