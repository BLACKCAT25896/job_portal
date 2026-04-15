import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mighty_job/api_handle/api_client.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_ticket_body.dart';
import 'package:mighty_job/util/app_constants.dart';

class SupportTicketRepository{
  final ApiClient apiClient;
  SupportTicketRepository({required this.apiClient});


  Future<Response?> getMySupportTicketsList(int page) async {
    return await apiClient.getData("${AppConstants.myTicket}?page=$page&per_page=10");
  }

  Future<Response?> getMySupportTicketWiseReplyList(String id, int page) async {
    return await apiClient.getData("${AppConstants.ticketReply}/$id?page=$page&per_page=10");
  }

  Future<Response?> createSupportTicket(TicketBody ticketBody) async {
    return await apiClient.postData(AppConstants.supportTicket, ticketBody.toJson());
  }

  Future<Response?> replyTicket(String ticketId, String comment) async {
    return await apiClient.postData(AppConstants.ticketReply, {
      "ticket_id": ticketId,
      "message": comment
    });
  }

  Future<Response?> getTicketCategories() async {
    return await apiClient.getData("${AppConstants.supportTicketCategory}?per_page=100&page=1");
  }

  Future<Response?> addTicketCategories(String name, String description) async {
    return await apiClient.postData(AppConstants.supportTicketCategory,{
      "name": name,
      "description": description
    });
  }
  Future<Response?> editTicketCategories(String name, String description, int id) async {
    return await apiClient.postData("${AppConstants.supportTicketCategory}/$id",{
      "name": name,
      "description": description,
      "_method":"put"
    });
  }

  Future<Response?> deleteTicketCategories(int id) async {
    return await apiClient.deleteData("${AppConstants.supportTicketCategory}/$id");
  }

  Future<Response?> ticketClose(String id) async {
    return await apiClient.getData("${AppConstants.closeTicket}$id");
  }

}