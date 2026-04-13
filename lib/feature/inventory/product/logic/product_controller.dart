import 'dart:developer';
import 'dart:math' as math;
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/category/controller/category_controller.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_body.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_details_model.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/variant_body.dart';
import 'package:ecommerce/feature/inventory/product/domain/repository/product_repository.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/logic/unit_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';


class ProductController extends GetxController implements GetxService {
  final ProductRepository productRepository;
  ProductController({required this.productRepository});

  XFile? thumbnail;
  List<XFile> productImage = [];
  void pickImage({bool isThumbnail = false, bool camera = false}) async {
    final ImagePicker picker = ImagePicker();
    if (isThumbnail) {
      XFile? picked = camera ? await picker.pickImage(source: ImageSource.camera)
          : await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        thumbnail = picked;
      }
    } else {
      List<XFile>? pickedImages = await picker.pickMultiImage();
      if (pickedImages.isNotEmpty) {
        productImage.addAll(pickedImages);
      }
    }
    update();
  }

  void pickVariationImage(int index) async {
    final ImagePicker picker = ImagePicker();
    XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    variants[index].image = picked;
    update();
  }

  void removeImage(int index) async {
    productImage.removeAt(index);
    update();
  }

  bool isLoading = false;
  ApiResponse<Product>? productModel;
  Future<void> getProductList(int offset, {String? search, int? categoryId, bool cache = false}) async {
    isLoading = true;
    Response? response = await productRepository.getProductList(offset, search:search, categoryId: categoryId);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<Product>.fromJson(response?.body, (json)=> Product.fromJson(json));
      if (offset == 1) {
        productModel = apiResponse;
      } else {
        productModel?.data?.data?.addAll(apiResponse.data?.data?? []);
        productModel?.data?.currentPage = apiResponse.data?.currentPage;
        productModel?.data?.total = apiResponse.data?.total;
      }
      isLoading = false;
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  void updateSelectVariant(Product item, int variantIndex) {
    if (item.variants == null || item.variants!.isEmpty) return;
    if (variantIndex < 0 || variantIndex >= item.variants!.length) return;
    for (var i = 0; i < item.variants!.length; i++) {
      item.variants![i].isSelected = false;
    }
    item.variants![variantIndex].isSelected = true;
    update();
  }


  void updateQuantity(Product item, {bool increment = true}){
    if(increment){
      item.quantity = item.quantity! + 1;
    }else{
      if(item.quantity! > 1) {
        item.quantity = item.quantity! - 1;
      }
    }
    update();
  }


  bool showWholeInformation = false;
  void toggleWholeInformation() {
    showWholeInformation =!showWholeInformation;
    update();
  }


  ProductDetailsModel? productDetailsModel;
  Future<void> getProductDetails(int id) async {
    isLoading = true;
    Response? response = await productRepository.productDetails(id);
    if (response?.statusCode == 200) {
     productDetailsModel = ProductDetailsModel.fromJson(response?.body);
     if(productDetailsModel?.data != null) {
       setSelectedProductInfo(productDetailsModel);
     }
      isLoading = false;
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  List<String> symbologyList = ["code_128", "code_39", "upc", "EAN8", "EAN13"];
  List<String> taxTypeList = ["exclusive", "inclusive"];


  String? selectedBarcodeSymbology;
  void setSelectedBarcodeSymbology(String selectedBarcodeSy) {
    selectedBarcodeSymbology = selectedBarcodeSy;
    update();
  }

  String? selectedTaxType;
  void setSelectedTaxType(String selectedTaxTy) {
    selectedTaxType = selectedTaxTy;
    update();
  }

  String? selectedProductType;
  void setSelectedProductType(String selectedProductTy) {
    selectedProductType = selectedProductTy;
    update();
  }



  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  HtmlEditorController descriptionController = HtmlEditorController();
  TextEditingController skuCodeController = TextEditingController();
  TextEditingController orderTaxController = TextEditingController();
  TextEditingController productCostController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productWholesalePriceController = TextEditingController();
  TextEditingController productDealerPriceController = TextEditingController();
  TextEditingController productProfitPercentageController = TextEditingController();
  TextEditingController stockAlertController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  void setSelectedProductInfo(ProductDetailsModel? product) {
    final item = product!.data!;
    nameController.text = item.name ?? "";
    shortDescriptionController.text = item.shortDescription ?? "";
    skuCodeController.text = item.sku ?? "";

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      if (item.description != null) {
        descriptionController.setText(item.description!);
      }
    });
    if(item.category != null && item.category?.isNotEmpty == true) {
      Get.find<CategoryController>().selectCategory(item.category?.first, notify: false);
    }
    if(item.brand != null) {
      Get.find<BrandController>().selectBrand(item.brand!, notify: false);
    }

    if(item.unit != null) {
      log("ai khane ki asce");
      Get.find<UnitController>().setSelectUnitItem(item.unit!, notify: false);
    }

    setVariantData(productDetailsModel);

    update();
  }

  void clearData() {
    nameController.clear();
    descriptionController.clear();
    skuCodeController.clear();
    orderTaxController.clear();
    productCostController.clear();
    productPriceController.clear();
    productWholesalePriceController.clear();
    productDealerPriceController.clear();
    productProfitPercentageController.clear();
    stockAlertController.clear();
    stockController.clear();
    selectedBarcodeSymbology = null;
    selectedTaxType = null;
    selectedProductType = null;
    productImage = [];
    thumbnail = null;


  }


  void setBarCode(String? code){
    skuCodeController.text = code??'';
    update();
  }

  Future<void> scanBarCode() async{
    String? scannedProductBarCode;
    try{
     // scannedProductBarCode = await FlutterBarcodeScanner.scanBarcode('#003E47', 'cancel', false, ScanMode.BARCODE);
    }
    on PlatformException{
        log('object');
    }
    setBarCode(scannedProductBarCode);
  }

  void randomNumberGenerate(){
    var rng = math.Random();
    var code = rng.nextInt(90000000) + 10000000;
    skuCodeController.text = code.toString();
  }


  Future<void> createNewProduct(ProductBody? productBody) async {
    log(productBody?.toJson().toString()??'');
    isLoading = true;
    update();
    Response? response = await productRepository.createNewProduct(productBody, thumbnail, productImage);
    if (response!.statusCode == 200) {
      clearData();
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getProductList(1);
      clearAllVariation();
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> updateProduct(ProductBody? productBody, int id) async {
    isLoading = true;
    update();
    Response? response =
        await productRepository.updateProduct(productBody, thumbnail, productImage, id);
    if (response!.statusCode == 200) {
      thumbnail = null;
      isLoading = false;
      Get.back();
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getProductList(1);
      getProductDetails(id);
      clearAllVariation();

    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> deleteProduct(int id) async {
    isLoading = true;
    Response? response = await productRepository.deleteProduct(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getProductList(1);
      isLoading = false;
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  List<VariantBody> variants = [
    VariantBody(
      nameController: TextEditingController(),
      unitItem: null,
      priceController: TextEditingController(),
      offerPriceController: TextEditingController(),
      discountController: TextEditingController(),
      stockController: TextEditingController(),
      weightController: TextEditingController(),
      image: null,
      stockAlertController: TextEditingController(),
      isDefault: false,
      attributes: [],
    ),
  ];

  void addVariant() {
    variants.add(
      VariantBody(
        nameController: TextEditingController(),
        priceController: TextEditingController(),
        offerPriceController: TextEditingController(),
        discountController: TextEditingController(),
        stockController: TextEditingController(),
        weightController: TextEditingController(),
        image: null,
        stockAlertController: TextEditingController(),
        isDefault: true,
        attributes: [],
      ),
    );
    update();
  }

  void setVariantData(ProductDetailsModel? product) {
    variants.clear();

    final variantList = product?.data?.variants;
    if (variantList == null || variantList.isEmpty) {
      addVariant();
      return;
    }

    for (var v in variantList) {
      log("image is=> ${v.attributes?.length}");
      VariantBody variantBody = VariantBody(
        nameController: TextEditingController(text: v.name ?? ''),
        priceController: TextEditingController(text: v.price?.toString() ?? ''),
        offerPriceController: TextEditingController(text: v.offerPrice?.toString() ?? ''),
        discountController: TextEditingController(text: v.discount?.toString() ?? ''),
        stockController: TextEditingController(text: v.stockQuantity?.toString() ?? ''),
        weightController: TextEditingController(text: v.weight?.toString() ?? ''),
        stockAlertController: TextEditingController(text: v.alertStockQuantity?.toString() ?? ''),
        imageUrl: v.image,
        isDefault: v.id == product?.data?.defaultVariant?.id,
        attributes: [],
      );

      /// Attributes
      log("attributes ==>${v.attributes?.length}");
      if (v.attributes != null && v.attributes!.isNotEmpty) {
        for (var attr in v.attributes!) {
          variantBody.attributes?.add(
            VariantAttribute(
              attributeId: attr.attributeId,
              attributeValueId: attr.attributeValueId,
              attributeItem: AttributeItem(
                id: attr.attributeId,
                name: attr.attributeName,
              ),
              attributeValueItem: AttributeValueItem(
                id: attr.attributeValueId,
                value: attr.attributeValue,
              ),
            ),
          );
        }
      }

      variants.add(variantBody);
    }

    update();
  }


  void toggleDefaultVariant(int index) {
    for (int i = 0; i < variants.length; i++) {
      variants[i].isDefault = i == index;
    }
    update();
  }


  void addAttributeToVariant(int variantIndex) {
    variants[variantIndex].attributes?.add(VariantAttribute());
    update();
  }

  void removeAttributeFromVariant(int variantIndex, int attrIndex) {
    variants[variantIndex].attributes?.removeAt(attrIndex);
    update();
  }



  void removeVariant(int index) {
    variants.removeAt(index);
    update();
  }

  void clearAllVariation(){
    variants.clear();
    update();
  }

  bool validateVariants() {
    for (var variant in variants) {
      if (variant.nameController.text.isEmpty ||
          variant.priceController.text.isEmpty ||
          variant.stockController.text.isEmpty ||
          variant.weightController.text.isEmpty ||
          variant.stockAlertController.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool isFeatured = false;
  void toggleFeatured({bool notify = true}) {
    isFeatured = !isFeatured;
    if(notify) {
      update();
    }
  }

  bool isTrending = false;
  void toggleTrending({bool notify = true}) {
    isTrending = !isTrending;
    if (notify) {
      update();
    }
  }
  bool isBestSelling = false;
  void toggleBestSelling({bool notify = true}) {
    isBestSelling = !isBestSelling;
    if (notify) {
      update();
    }
  }

  bool isFlashDeal = false;
  void toggleFlashDeal({bool notify = true}) {
    isFlashDeal = !isFlashDeal;
    if (notify) {
      update();
    }
  }

}
