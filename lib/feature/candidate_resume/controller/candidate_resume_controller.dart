import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:job/api_handle/api_checker.dart';
import 'package:job/api_handle/api_client.dart';
import 'package:job/api_handle/global_api_response_model.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:job/feature/candidate_resume/domain/repository/candidate_resume_repository.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

class CandidateResumeController extends GetxController implements GetxService{
  final CandidateResumeRepository candidateResumeRepository;
  CandidateResumeController({required this.candidateResumeRepository});




  bool isLoading = false;
  ApiResponse<CandidateResumeItem>? candidateResumeModel;
  Future<void> getCandidateResumeList(int offset) async {
    Response? response = await candidateResumeRepository.getCandidateResumeList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<CandidateResumeItem>.fromJson(response?.body, (json)=> CandidateResumeItem.fromJson(json));
      if(offset == 1){
        candidateResumeModel = apiResponse;
      }else{
        candidateResumeModel?.data?.data?.addAll(apiResponse.data!.data!);
        candidateResumeModel?.data?.currentPage = apiResponse.data?.currentPage;
        candidateResumeModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }


  MultipartDocument? multipartDocument;
  FilePickerResult? otherFile;
  PlatformFile? objFile;

  Future<bool> pickOtherFile(bool isRemove) async {
    if(isRemove){
      otherFile=null;
    }else{
      otherFile = (await FilePicker.platform.pickFiles(withData: true))!;
      if(otherFile != null){
        objFile = otherFile!.files.single;
        multipartDocument = MultipartDocument("file", objFile);
      }
    }
    update();
    return true;
  }


  Future<void> createNewCandidateResume( CandidateResumeBody body,) async {
    isLoading = true;
    update();
    Response? response = await candidateResumeRepository.createNewCandidateResume(body, multipartDocument);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getCandidateResumeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateCandidateResume(CandidateResumeBody body, int id) async {
    isLoading = true;
    update();
    Response? response = await candidateResumeRepository.updateCandidateResume(body, id, multipartDocument);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getCandidateResumeList(1);
    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }


  Future<void> deleteCandidateResume(int id) async {
    isLoading = true;
    Response? response = await candidateResumeRepository.deleteCandidateResume(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getCandidateResumeList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  CandidateResumeItem? selectedCandidateResumeItem;
  void selectCandidateResume(CandidateResumeItem item){
    selectedCandidateResumeItem = item;
    update();
  }

  bool isDownloading = false;

  Future<void> downloadFile({required String url, required String fileName}) async {
    try {
      isDownloading = true;
      update();
      if (kIsWeb) {
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", fileName)
          ..click();
        log("${anchor.hostname}");
        return;
      }

      final response = await http.get(Uri.parse(url));
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/$fileName");
      await file.writeAsBytes(response.bodyBytes);
      await OpenFilex.open(file.path);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isDownloading = false;
      update();
    }
  }
  
}