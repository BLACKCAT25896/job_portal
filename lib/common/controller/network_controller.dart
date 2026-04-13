
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController implements GetxService {


  @override
  onInit(){
    super.onInit();
    isInternetAvailable();
  }

  bool isOnline = true;
  Future<bool> isInternetAvailable() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult.contains(ConnectivityResult.none)) {
       log("===========>No Internet Connection");
       update();
       isOnline = false;
      return false;
    }else {
       log("===========>internet Ase");
       update();
       isOnline = true;
       return true;
     }

  }
}