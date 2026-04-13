import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_body.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/repository/auction_repository.dart';
import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';

class AuctionController extends GetxController implements GetxService {
  final AuctionRepository auctionRepository;
  AuctionController({required this.auctionRepository});


  bool isLoading = false;
  ApiResponse<AuctionItem>? auctionModel;
  Future<void> getAuction(int page) async {
    Response? response = await auctionRepository.getAuction(page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<AuctionItem>.fromJson(response?.body, (json)=> AuctionItem.fromJson(json));
      if(page == 1){
        auctionModel = apiResponse;
      }else{
        auctionModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        auctionModel?.data?.total = apiResponse.data?.total;
        auctionModel?.data?.currentPage = apiResponse.data?.currentPage;
      }
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }




  Future<void> createAuction(AuctionBody body) async {
    isLoading = true;
    update();
    Response? response = await auctionRepository.createAuction(body);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getAuction(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> editAuction(AuctionBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await auctionRepository.editAuction(body, id);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getAuction(1);
    } else {
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> deleteAuction(int id) async {
    Response? response = await auctionRepository.deleteAuction(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getAuction(1);
    } else {
      ApiChecker.checkApi(response!);
    }
    update();
  }


}
  