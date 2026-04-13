import 'dart:developer';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/search_product_model.dart';
import 'package:ecommerce/feature/inventory/product/domain/repository/search_product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class SearchProductController extends GetxController implements GetxService{
  final SearchProductRepository searchProductRepository;
  SearchProductController({required this.searchProductRepository});





  Barcode? _barcode;
  Barcode? get barcode => _barcode;
  void handleBarcode(BarcodeCapture barcodes) {
    _barcode = barcodes.barcodes.firstOrNull;
    update();
  }





  bool isLoading = false;
  SearchedProductModel? productModel;
  Future<Response> getSearchProductList(String code, String wareHouseId, {bool fromScan = false, productSearch = false}) async {
    isLoading = true;
    Response? response = await searchProductRepository.getSearchProductList(code, wareHouseId);
    if (response?.statusCode == 200) {
      productModel = SearchedProductModel.fromJson(response?.body);
      log("bangla vai==> ${productModel?.products?.length}");
      isLoading = false;
      if(productModel != null){
        if(fromScan){
          addProduct(productModel!.products![0], back: false);
          Get.back();
        }

      }
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
    return response!;
  }
  Future<Response> getDefaultSearchProductList() async {
    isLoading = true;
    Response? response = await searchProductRepository.getDefaultSearchProductList();
    if (response?.statusCode == 200) {
      productModel = SearchedProductModel.fromJson(response?.body);
      isLoading = false;
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
    return response!;
  }


  bool isAdd = true;
  void setAddOrSub(bool add, int index){
    isAdd = add;
    selectedProductsList[index].isAdd = add;
    update();
  }


  List<Products> selectedProductsList  = [];
  double grandTotal = 0;


  bool isProductInCart(Products product) {
    return selectedProductsList.any((item) => item.id == product.id);
  }


  void addProduct(Products product, {bool back = true, bool fromPurchased = false}){
    grandTotal = 0;

    bool productExists = false;
    for (var item in selectedProductsList) {
      if (item.id == product.id) {
        item.quantity = item.quantity! + 1;
        productExists = true;
        break;
      }
    }
    if (!productExists) {
      selectedProductsList.add(product);
    }


    for (var item in selectedProductsList) {
      if(fromPurchased){
        grandTotal += (item.cost! * item.quantity!);
      }else{
        grandTotal += (double.parse(item.amountController?.text.trim()?? "0") * item.quantity!);
      }

      grandTotalNotifier.value = grandTotal;
    }
    if(back){
      Get.back();
    }

    update();
  }

  void removeProduct(int index, bool fromPurchased){
    selectedProductsList.removeAt(index);
    grandTotal = 0;
    for (var item in selectedProductsList) {
      if(fromPurchased){
        grandTotal += (item.cost! * item.quantity!);
      }else{
        grandTotal += (double.parse(item.amountController?.text.trim()?? "0") * item.quantity!);
      }

    }
    grandTotalNotifier.value = grandTotal;
    update();
  }

  void removeAllProduct({bool notify = true}){
    selectedProductsList.clear();
    grandTotal = 0;
    grandTotalNotifier.value = grandTotal;
    if(notify){
      update();
    }

  }

  ValueNotifier<double> grandTotalNotifier = ValueNotifier(0);
  void setProductQuantity(int index, int quantity, bool fromPurchased, {bool notify = true}){
    grandTotal = 0;
    selectedProductsList[index].quantity = quantity;
    for (var item in selectedProductsList) {
      if(fromPurchased){
        grandTotal += (item.cost! * item.quantity!);
      }else{
        grandTotal += (double.parse(item.amountController?.text.trim()?? "0") * item.quantity!);
      }

    }
    grandTotalNotifier.value = grandTotal;
    if(notify){
      update();
    }
  }

  void changePrice(int index, String amount){
    grandTotal = 0;
    selectedProductsList[index].amountController?.text = amount;
    for (var item in selectedProductsList) {
      grandTotal += (double.parse(item.amountController?.text.trim()?? "0") * item.quantity!);
    }
    grandTotalNotifier.value = grandTotal;
  }


}