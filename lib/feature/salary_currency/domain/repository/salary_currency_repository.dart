import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_body.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SalaryCurrencyRepository{
  final ApiClient apiClient;
  SalaryCurrencyRepository({required this.apiClient});


  Future<Response?> getSalaryCurrencyList(int page, String search) async {
    return await apiClient.getData("${AppConstants.salaryCurrencies}?page=$page&perPage=10&search=$search");
  }

  Future<Response?> createNewSalaryCurrency(SalaryCurrencyBody body) async {
    return await apiClient.postData(AppConstants.salaryCurrencies, body.toJson());
  }

  Future<Response?> updateSalaryCurrency(SalaryCurrencyBody body, int id) async {
    return await apiClient.postData("${AppConstants.salaryCurrencies}/$id",
        body.toJson());
  }


  Future<Response?> deleteSalaryCurrency (int id) async {
    return await apiClient.deleteData("${AppConstants.salaryCurrencies}/$id");
  }
}