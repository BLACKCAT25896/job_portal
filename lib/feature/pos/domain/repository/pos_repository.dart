import 'package:ecommerce/api_handle/api_client.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PosRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  PosRepository( {required this.apiClient, required this.sharedPreferences,});



  Future<void> setBluetoothAddress(String? address) async {
    await sharedPreferences.setString(AppConstants.bluetoothMacAddress, address ?? '');
  }
  String? getBluetoothAddress() => sharedPreferences.getString(AppConstants.bluetoothMacAddress);

}