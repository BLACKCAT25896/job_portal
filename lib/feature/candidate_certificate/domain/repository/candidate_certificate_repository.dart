import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_body.dart';
import 'package:job/util/app_constants.dart';

class CandidateCertificateRepository{
  final ApiClient apiClient;
  CandidateCertificateRepository({required this.apiClient});


  Future<Response?> getCandidateCertificateList(int page) async {
    return await apiClient.getData("${AppConstants.candidateCertificate}?page=$page&perPage=10");
  }

  Future<Response?> createNewCandidateCertificate( CandidateCertificateBody body,) async {
    return await apiClient.postData(AppConstants.candidateCertificate, body.toJson());
  }

  Future<Response?> updateCandidateCertificate(CandidateCertificateBody body, int id) async {
    return await apiClient.putData("${AppConstants.candidateCertificate}/$id", body.toJson());
  }
  

  Future<Response?> deleteCandidateCertificate (int id) async {
    return await apiClient.deleteData("${AppConstants.candidateCertificate}/$id");
  }
}