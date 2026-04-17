

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';

Future<ApiResponse<T>?> fetchPaginatedList<T>({
  required Future<Response?> Function() apiCall,
  required ApiResponse<T>? currentModel,
  required T Function(Map<String, dynamic>) fromJson,
  required int offset,
  required Function(ApiResponse<T> value) onUpdate,
}) async {
  Response? response = await apiCall();

  if (response?.statusCode == 200) {
    final apiResponse = ApiResponse<T>.fromJson(
      response?.body,
          (json) => fromJson(json),
    );

    if (offset == 1 || currentModel == null) {
      currentModel = apiResponse;
    } else {
      currentModel.data?.data?.addAll(apiResponse.data?.data ?? []);
      currentModel.data?.total = apiResponse.data?.total;
      currentModel.data?.currentPage = apiResponse.data?.currentPage;
    }

    onUpdate(currentModel);
    return currentModel;
  } else {
    ApiChecker.checkApi(response!);
    return null;
  }
}