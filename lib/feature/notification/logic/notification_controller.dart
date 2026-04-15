import 'package:get/get.dart';
import 'package:mighty_job/api_handle/api_checker.dart';
import 'package:mighty_job/feature/notification/domain/model/notification_model.dart';
import 'package:mighty_job/feature/notification/domain/repository/notification_repository.dart';

class NotificationController extends GetxController implements GetxService{
  final NotificationRepository notificationRepository;
  NotificationController({required this.notificationRepository});

  bool isLoading = false;
  NotificationModel? notificationModel;
  Future<NotificationModel?> getNotificationList(int offset,) async {
    isLoading = true;
    Response? response = await notificationRepository.getNotificationList(offset);
    if (response?.statusCode == 200) {
      if(offset == 1){
        notificationModel = NotificationModel.fromJson(response?.body);
      }else{
        notificationModel?.data?.data?.addAll(NotificationModel.fromJson(response?.body).data!.data!);
        notificationModel?.data?.currentPage = NotificationModel.fromJson(response?.body).data?.currentPage;
        notificationModel?.data?.total = NotificationModel.fromJson(response?.body).data?.total;
      }
      isLoading = false;

    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
    return notificationModel;
  }







  Future<void> getNotificationDetails(String id) async {
    isLoading = true;
    Response? response = await notificationRepository.getNotificationDetails(id);
    if (response?.statusCode == 200) {
      getNotificationList(1);
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
}