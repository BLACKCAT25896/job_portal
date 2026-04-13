import 'package:get/get.dart';

class RouteController extends GetxController implements GetxService{
  RxString currentRoute = '/'.obs;

  void updateRoute(String route) {
    currentRoute.value = route;
  }
}
