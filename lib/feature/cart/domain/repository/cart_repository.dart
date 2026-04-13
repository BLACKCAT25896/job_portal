import 'dart:convert';

import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  List<Product> selectedItems = [];
  CartRepository({required this.apiClient, required this.sharedPreferences});

  Variants? _getSelectedVariant(Product product) {
    if (product.variants == null) return null;

    for (var v in product.variants!) {
      if (v.isSelected == true) {
        return v;
      }
    }
    return null;
  }

  Future<void> addToCart(Product item) async {
    Variants? selectedVariant = _getSelectedVariant(item);

    int index = selectedItems.indexWhere((e) {
      Variants? existingVariant = _getSelectedVariant(e);
      return e.id == item.id && existingVariant?.id == selectedVariant!.id;
    });

    if (index != -1) {
      selectedItems[index].quantity = (selectedItems[index].quantity ?? 1) + 1;
    } else {
      Product clonedProduct = Product.fromJson(jsonDecode(jsonEncode(item.toJson())));
      clonedProduct.quantity = clonedProduct.quantity ?? 1;
      selectedItems.add(clonedProduct);
    }
    await saveCart();
  }

  Future<void> decreaseQuantity(int index) async {
    if ((selectedItems[index].quantity ?? 1) > 1) {
      selectedItems[index].quantity = selectedItems[index].quantity! - 1;
    } else {
      selectedItems.removeAt(index);
    }
    await saveCart();
  }

  Future<void> removeFromCart(int index) async {
    selectedItems.removeAt(index);
    await saveCart();
  }

  Future<void> saveCart() async {
    List<String> cartJsonList =
    selectedItems.map((e) => jsonEncode(e.toJson())).toList();
    await sharedPreferences.setStringList(AppConstants.cartList, cartJsonList);
  }

  Future<void> loadCart() async {
    List<String>? cartJsonList =
    sharedPreferences.getStringList(AppConstants.cartList);
    if (cartJsonList != null) {
      selectedItems = cartJsonList.map((e) => Product.fromJson(jsonDecode(e))).toList();
    }
  }

  Future<void> clearCart() async {
    selectedItems.clear();
    await sharedPreferences.remove(AppConstants.cartList);
  }
}