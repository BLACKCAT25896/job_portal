import 'package:ecommerce/feature/cart/domain/repository/cart_repository.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';

class CartController extends GetxController implements GetxService {
  final CartRepository cartRepository;
  CartController({required this.cartRepository});

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  double totalPrice = 0.0;
  bool isLoading = false;
  List<Product> get selectedItems => cartRepository.selectedItems;
  double calculateItemTotal(Product item) {
    final Variants selectedVariant = item.variants != null && item.variants!.isNotEmpty
        ? item.variants!.firstWhere((v) => v.isSelected == true,
      orElse: () => item.variants!.first,
    ) : Variants(price: 0);
    final double price = selectedVariant.price ?? 0;
    final int quantity = item.quantity ?? 1;
    return price * quantity;
  }

  void calculateTotalPrice() {
    totalPrice = selectedItems.fold(0.0, (sum, item) => sum + calculateItemTotal(item));
  }


  Future<void> addToCart(Product item) async {
    await cartRepository.addToCart(item);
    item.updateController();
    calculateTotalPrice();
    showCustomSnackBar("added_successfully".tr, isError: false);
    update();
  }


  Future<void> removeFromCart(int index) async {
    selectedItems[index].disposeController();
    await cartRepository.removeFromCart(index);
    calculateTotalPrice();
    update();
  }





  Future<void> setQuantity(int index, int quantity, {bool fromButton = false}) async {
    if (quantity <= 0) {
      await removeFromCart(index);
      return;
    }

    final item = selectedItems[index];
    item.quantity = quantity;
    if (fromButton) {
      item.qtyController?.text = quantity.toString();
      item.qtyController?.selection = TextSelection.fromPosition(
        TextPosition(offset: item.qtyController?.text.length??0),
      );
    }
    await cartRepository.saveCart();
    calculateTotalPrice();
    update();
  }

  Future<void> loadCart() async {
    await cartRepository.loadCart();
    for (var item in selectedItems) {
      item.updateController();
    }
    calculateTotalPrice();
    update();
  }


  Future<void> clearCart() async {
    for (var item in selectedItems) {
      item.disposeController();
    }
    await cartRepository.clearCart();
    totalPrice = 0.0;
    update();
  }


  TextEditingController couponController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  double returnToCustomerAmount = 0 ;
  double couponCodeAmount = 0;
  double extraDiscountAmount = 0;
  int discountTypeIndex = 0;
  String? selectedDiscountType = '';

  void setReturnAmountToZero({bool isUpdate = true}) {
    returnToCustomerAmount = 0;
    if(isUpdate){
      update();
    }
  }
  void getReturnAmount( double totalCostAmount){
    setReturnAmountToZero();
    returnToCustomerAmount = totalCostAmount - totalPrice;
    update();
  }
  void setSelectedDiscountType(String? type){
    selectedDiscountType = type;
    update();
  }

}
