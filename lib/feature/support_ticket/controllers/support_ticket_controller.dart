
import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_reply_model.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_ticket_body.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_ticket_model.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/ticket_category_model.dart';
import 'package:mighty_job/feature/support_ticket/domain/repositories/support_ticket_repository.dart';

class SupportTicketController extends GetxController implements GetxService {
  final SupportTicketRepository supportTicketRepository;
  SupportTicketController({required this.supportTicketRepository});

  bool isLoading = false;
  ApiResponse<SupportTicketItem>? supportTicketModel;
  Future<void> getTicketList(int offset) async {
    isLoading = true;
    Response? response = await supportTicketRepository.getMySupportTicketsList(offset);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<SupportTicketItem>.fromJson(response?.body, (json)=> SupportTicketItem.fromJson(json));
      if(offset == 1){
        supportTicketModel = apiResponse;
      }else{
        supportTicketModel?.data?.data?.addAll(apiResponse.data!.data!);
        supportTicketModel?.data?.currentPage = apiResponse.data?.currentPage;
        supportTicketModel?.data?.total = apiResponse.data?.total;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }



  List<String> priority = ['high', 'medium', 'low'];

  String selectedPriority = "high";
  void setSelectedPriority(String type, {bool reload = true}){
    selectedPriority = type;
    update();
  }

  ApiResponse<TicketCategoryItem>? ticketCategoryModel;
  Future<void> getTicketCategoryList() async {
    Response? response = await supportTicketRepository.getTicketCategories();
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<TicketCategoryItem>.fromJson(response?.body, (json)=> TicketCategoryItem.fromJson(json));
      ticketCategoryModel = apiResponse;
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> addTicketCategory(String name, String description) async {
    isLoading = true;
    update();
    Response? response = await supportTicketRepository.addTicketCategories(name, description);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("added_successfully".tr, isError: false);
      getTicketCategoryList();
    }else{
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
  }

  Future<void> editTicketCategoryList(String name, String description, int id) async {
    isLoading = true;
    update();
    Response? response = await supportTicketRepository.editTicketCategories(name, description, id);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getTicketCategoryList();
    }else{
      ApiChecker.checkApi(response!);
    }
    isLoading = false;
    update();
  }
  Future<void> deleteTicketCategory(int id) async {
    Response? response = await supportTicketRepository.deleteTicketCategories(id);
    if (response?.statusCode == 200) {
      showCustomSnackBar("deleted_successfully".tr, isError: false);
      getTicketCategoryList();
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  TicketCategoryItem? selectedTicketCategory;
  void setSelectedTicketCategory(TicketCategoryItem? item, {bool reload = true}){
    selectedTicketCategory = item;
    update();
  }



  ApiResponse<ReplyItem>? supportReplyModel;
  Future<void> getReplyList(String id, int page) async {
    if(page == 1){
      supportReplyModel = null;
    }
    Response? response = await supportTicketRepository.getMySupportTicketWiseReplyList(id,page);
    if (response?.statusCode == 200) {
      final apiResponse = ApiResponse<ReplyItem>.fromJson(response?.body, (json)=> ReplyItem.fromJson(json));
      if(page == 1){
        supportReplyModel = apiResponse;
      }else{
        supportReplyModel?.data?.data?.addAll(apiResponse.data?.data??[]);
        supportReplyModel?.data?.currentPage = apiResponse.data?.currentPage;
        supportReplyModel?.data?.total = apiResponse.data?.total;
      }
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> createSupportTicket(TicketBody ticketBody) async {
    isLoading = true;
    update();
    Response? response = await supportTicketRepository.createSupportTicket(ticketBody);
    if (response?.statusCode == 200) {
      isLoading = false;
      Get.back();
      getTicketList(1);
      showCustomSnackBar("ticket_created".tr, isError: false);
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  bool isReplyLoading = false;
  Future<void> replyTicket(String ticketId, String comment) async {
    isReplyLoading = true;
    update();
    Response? response = await supportTicketRepository.replyTicket(ticketId, comment);
    if (response?.statusCode == 200) {
      isReplyLoading = false;
      getReplyList(ticketId, 1);
    }else{
      isReplyLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  Future<void> closeTicket(String ticketId) async {
    Response? response = await supportTicketRepository.ticketClose(ticketId);
    if (response?.statusCode == 200) {
      showCustomSnackBar("updated_successfully".tr, isError: false);
      getTicketList(1);
    }else{
      ApiChecker.checkApi(response!);
    }
    update();
  }

}
