
import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';

class ProductRepository{
  final ApiClient apiClient;
  ProductRepository({required this.apiClient});

  Future<Response?> getProductList(int page, {String? search, int? categoryId, bool cache = false}) async {

    final params = <String, String>{'page': '$page', 'perPage': '10',
      if (search != null && search.isNotEmpty) 'search': search,
      if (categoryId != null) 'category_id': '$categoryId',
    };
    final url = Uri.parse(AppConstants.products).replace(queryParameters: params).toString();
    return await apiClient.getData(url);
  }

  Future<Response?> productDetails(int id) async {
    return await apiClient.getData("${AppConstants.products}/$id");
  }

  Future<Response?> createNewProduct(ProductBody? productBody, XFile? thumbnail,
      List<XFile>? gallery) async {

    Map<String, String> fields = {};
    List<MultipartBody> images = [];

    fields['name'] = productBody?.name ?? '';
    fields['slug'] = productBody?.slug ?? '';
    fields['product_type'] = productBody?.productType ?? '';
    fields['short_description'] = productBody?.shortDescription ?? '';
    fields['description'] = productBody?.description ?? '';
    fields['vat'] = productBody?.vat ?? '';
    fields['pst'] = productBody?.pst ?? '';
    if (productBody?.brandId != null) {
      fields['brand_id'] = productBody!.brandId.toString();
    }

    if (productBody?.unitId != null) {
      fields['unit_id'] = productBody!.unitId.toString();
    }

    fields['is_featured'] = productBody?.isFeatured == 1 ? "1" : "0";
    fields['is_trending'] = productBody?.isTrending == 1 ? "1" : "0";
    fields['is_best_selling'] = productBody?.isBestSelling == 1 ? "1" : "0";
    fields['is_flash_deal'] = productBody?.isFlashDeal == 1 ? "1" : "0";
    fields['is_new'] = productBody?.isNew == 1 ? "1" : "0";
    fields['is_published'] = productBody?.isPublished == 1 ? "1" : "0";

    for (int i = 0; i < (productBody?.categories?.length ?? 0); i++) {
      fields['category_ids[$i]'] = productBody!.categories![i].toString();
    }

    for (int i = 0; i < (productBody?.variants?.length ?? 0); i++) {
      final variant = productBody!.variants![i];

      fields['variants[$i][name]'] = variant.name ?? '';
      fields['variants[$i][sku]'] = variant.sku ?? '';
      fields['variants[$i][price]'] = variant.price?.toString() ?? '';
      fields['variants[$i][stock_quantity]'] = variant.stockQuantity?.toString() ?? '';
      fields['variants[$i][weight]'] = variant.weight?.toString() ?? '';
      fields['variants[$i][alert_stock_quantity]'] = variant.alertStockQuantity?.toString() ?? '';
      fields['variants[$i][stock_tracking]'] = variant.stockTracking == 1 ? "1" : "0";
      fields['variants[$i][is_default]'] = variant.isDefault == 1 ? "1" : "0";


      for (int j = 0; j < (variant.attributes?.length ?? 0); j++) {
        final attr = variant.attributes![j];
        fields['variants[$i][attributes][$j][attribute_id]'] = attr.attributeId.toString();
        fields['variants[$i][attributes][$j][attribute_value_id]'] = attr.attributeValueId.toString();
      }

      if (variant.imageFile != null) {
        images.add(MultipartBody("variants[$i][image]", variant.imageFile!));
      }
    }

    for (int i = 0; i < (gallery?.length ?? 0); i++) {
      images.add(MultipartBody("gallery[$i]", gallery![i]));
    }

    MultipartBody? thumb;
    if (thumbnail != null) {
      thumb = MultipartBody("thumbnail", thumbnail);
    }
    return await apiClient.postMultipartData(AppConstants.products, fields, images, thumb, []);
  }


  Future<Response?> updateProduct(ProductBody? productBody, XFile? thumbnail,
      List<XFile>? gallery, int id) async {

    Map<String, String> fields = {};
    List<MultipartBody> images = [];

    fields['_method'] = 'put';
    fields['name'] = productBody?.name ?? '';
    fields['slug'] = productBody?.slug ?? '';
    fields['product_type'] = productBody?.productType ?? '';
    fields['short_description'] = productBody?.shortDescription ?? '';
    fields['description'] = productBody?.description ?? '';
    fields['vat'] = productBody?.vat ?? '';
    fields['pst'] = productBody?.pst ?? '';
    if (productBody?.brandId != null) {
      fields['brand_id'] = productBody!.brandId.toString();
    }

    if (productBody?.unitId != null) {
      fields['unit_id'] = productBody!.unitId.toString();
    }

    fields['is_featured'] = productBody?.isFeatured == 1 ? "1" : "0";
    fields['is_trending'] = productBody?.isTrending == 1 ? "1" : "0";
    fields['is_best_selling'] = productBody?.isBestSelling == 1 ? "1" : "0";
    fields['is_flash_deal'] = productBody?.isFlashDeal == 1 ? "1" : "0";
    fields['is_new'] = productBody?.isNew == 1 ? "1" : "0";
    fields['is_published'] = productBody?.isPublished == 1 ? "1" : "0";

    for (int i = 0; i < (productBody?.categories?.length ?? 0); i++) {
      fields['category_ids[$i]'] = productBody!.categories![i].toString();
    }

    for (int i = 0; i < (productBody?.variants?.length ?? 0); i++) {
      final variant = productBody!.variants![i];

      fields['variants[$i][name]'] = variant.name ?? '';
      fields['variants[$i][sku]'] = variant.sku ?? '';
      fields['variants[$i][price]'] = variant.price?.toString() ?? '';
      fields['variants[$i][stock_quantity]'] = variant.stockQuantity?.toString() ?? '';
      fields['variants[$i][weight]'] = variant.weight?.toString() ?? '';
      fields['variants[$i][alert_stock_quantity]'] = variant.alertStockQuantity?.toString() ?? '';
      fields['variants[$i][stock_tracking]'] = variant.stockTracking == 1 ? "1" : "0";
      fields['variants[$i][is_default]'] = variant.isDefault == 1 ? "1" : "0";


      for (int j = 0; j < (variant.attributes?.length ?? 0); j++) {
        final attr = variant.attributes![j];
        fields['variants[$i][attributes][$j][attribute_id]'] = attr.attributeId.toString();
        fields['variants[$i][attributes][$j][attribute_value_id]'] = attr.attributeValueId.toString();
      }

      if (variant.imageFile != null) {
        images.add(MultipartBody("variants[$i][image]", variant.imageFile!));
      }
    }

    for (int i = 0; i < (gallery?.length ?? 0); i++) {
      images.add(MultipartBody("gallery[$i]", gallery![i]));
    }

    MultipartBody? thumb;
    if (thumbnail != null) {
      thumb = MultipartBody("thumbnail", thumbnail);
    }

    return await apiClient.updateMultipartData("${AppConstants.products}/$id", fields,
      images, thumb, []);
  }




  Future<Response?> deleteProduct (int id) async {
    return await apiClient.deleteData("${AppConstants.products}/$id");
  }
  Future<Response?> getSearchProductList (String code, String wareHouseId) async {
    return await apiClient.getData("${AppConstants.products}?code=$code&ware_house_id=$wareHouseId");
  }

}