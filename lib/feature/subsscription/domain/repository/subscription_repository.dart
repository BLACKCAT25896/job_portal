import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';

class SubscriptionRepository{
  final ApiClient apiClient;
  SubscriptionRepository({required this.apiClient});

  Future<Response?> getPackageList() async {
    return await apiClient.getData("");
  }

  Future<Response?> purchasePackage(int packageId, String userPhone, String shopPhone) async {
    return await apiClient.postData("",{
      "package_id": packageId,
      "user_phone": userPhone,
      "shop_phone": shopPhone,
      "is_seen":"0",
      "is_processed":"0"
    });
  }
}