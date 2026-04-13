
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_selection_for_action_widget.dart';
import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:ecommerce/feature/inventory/warehouse/presentation/widgets/select_warehouse_widget.dart';
import 'package:ecommerce/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/date_selection_widget.dart';
import 'package:ecommerce/feature/payment_method/logic/payment_method_controller.dart';
import 'package:ecommerce/feature/payment_method/presentation/widgets/select_payment_method_widget.dart';
import 'package:ecommerce/feature/payment_method/presentation/widgets/select_payment_type_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_body.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart' hide Product;
import 'package:ecommerce/feature/purchase_management/purchase/logic/purchase_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/logic/supplier_controller.dart';
import 'package:ecommerce/feature/purchase_management/supplier/presentation/widgets/select_supplier_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewPurchaseWidget extends StatefulWidget {
  final PurchaseItem? purchaseItem;
  const CreateNewPurchaseWidget({super.key, this.purchaseItem, });

  @override
  State<CreateNewPurchaseWidget> createState() => _CreateNewPurchaseWidgetState();
}

class _CreateNewPurchaseWidgetState extends State<CreateNewPurchaseWidget> {
  TextEditingController discountController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.purchaseItem != null){
      discountController.text = widget.purchaseItem?.discountAmount.toString()??"0";
      Get.find<PaymentMethodController>().setSelectPaymentMethodItem(
          PaymentMethodItem(name: widget.purchaseItem?.paymentMethod), notify: false);
      Get.find<PaymentMethodController>().setSelectPaymentType(widget.purchaseItem?.paymentStatus??"unpaid");
      Get.find<SupplierController>().setSelectSupplierItem(SupplierItem(name: widget.purchaseItem?.supplier?.name,
      id: widget.purchaseItem?.supplier?.id), notify: false);


      Get.find<CartController>().clearCart();

      for (int i = 0; i < (widget.purchaseItem?.items?.length ?? 0); i++) {
        final currentItem = widget.purchaseItem!.items![i];

        Product item = Product(
          id: currentItem.product?.id,
          name: currentItem.product?.name,
          thumbnail: null,
          quantity: currentItem.quantity,
          description: null,
          variants: currentItem.variant != null
              ? [Variants(
            id: currentItem.variant?.id,
            name: currentItem.variant?.name,
            price: currentItem.unitPrice,
          )] : [],
        );

        Get.find<CartController>().addToCart(item);
      }

      
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(builder: (purchaseController) {
      return GetBuilder<CartController>(builder: (cartController) {
          return SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [

                ResponsiveMasonryGrid(width: 300, children: [

                  DateSelectionWidget(title: "purchase_date".tr),
                  SelectPaymentMethodWidget(),
                  SelectPaymentTypeWidget(),
                  SelectSupplierWidget(),
                  SelectWarehouseWidget(),
                  CustomTextField(title: 'discount'.tr,
                      hintText: "0",
                      inputFormatters: [AppConstants.numberFormat],
                      isAmount: true,
                      onChanged: (val){
                        setState(() {

                        });
                      },
                      controller: discountController),

                ]),



                    SizedBox(height: Dimensions.paddingSizeDefault),
                ProductSelectionForActionWidget(searchController: searchController,
                    scrollController: scrollController),

                SizedBox(height: Dimensions.paddingSizeDefault),


                purchaseController.isLoading?
                const Center(child: CircularProgressIndicator()):
                CustomButton(onTap: (){
                  int? supplierId = Get.find<SupplierController>().selectedSupplierItem?.id;
                  int? warehouseId = Get.find<WarehouseController>().selectedWarehouseItem?.id;
                  String? paymentMethod = Get.find<PaymentMethodController>().selectedPaymentMethodItem?.type?.toLowerCase();
                  String? paymentType = Get.find<PaymentMethodController>().selectedPaymentType;
                  String? paymentDate = Get.find<DatePickerController>().formatedFromDate;
                  List<PurchaseItems> items = [];

                  for (int i = 0; i < cartController.selectedItems.length; i++) {
                    final item = cartController.selectedItems[i];
                    final double unitPrice = item.variants?.first.price ?? 0.0;
                    final int quantity = item.quantity ?? 0;
                    PurchaseItems orderItem = PurchaseItems(
                      productItemId: item.id,
                      quantity: quantity,
                      unitPrice: unitPrice,
                      totalCost: unitPrice * quantity,
                      productVariantId: item.variants?.first.id);
                    items.add(orderItem);
                  }


                  if(supplierId == null){
                    showCustomSnackBar("select_supplier".tr);
                  }else if(warehouseId == null){
                    showCustomSnackBar("select_warehouse".tr);
                  }
                  else if(paymentMethod == null){
                    showCustomSnackBar("select_payment_method".tr);
                  }else if(paymentType == null){
                    showCustomSnackBar("select_payment_type".tr);
                  }else if(items.isEmpty){
                    showCustomSnackBar("select_ingredient".tr);
                  }else{
                    PurchaseBody body = PurchaseBody(
                      supplierId: supplierId,
                      warehouseId: warehouseId,
                      paymentMethod: paymentMethod,
                      subTotal: cartController.totalPrice,
                      totalAmount: cartController.totalPrice,
                      discountAmount: discountController.text.isNotEmpty? PriceConverter.parseAmount(discountController.text): 0,
                      paymentStatus: paymentType,
                      purchaseDate: paymentDate,
                      items: items);
                    if(widget.purchaseItem != null){
                      purchaseController.editPurchase(body, widget.purchaseItem!.id!);
                    }else{
                      purchaseController.createPurchase(body);
                    }
                  }
                }, text: "confirm".tr)
                ]),
              ),
            );
        }
      );
      }
    );
  }
}
