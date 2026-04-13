import 'package:get/get.dart';
import 'package:ecommerce/feature/order_management/order_enum.dart';
import 'package:ecommerce/feature/pos_management/pos/domain/repository/pos_repository.dart';
import 'package:ecommerce/feature/pos_management/pos_setting_enum.dart';

class PosController extends GetxController implements GetxService {
  final PosRepository foodRepository;
  PosController({required this.foodRepository});


  bool isLoading = false;






  OrderType? selectedOrder;
  void setSelectedOrderType(OrderType? orderType){
    selectedOrder = orderType;
    update();
  }


  final Map<PosSetting, bool> settings = {
    for (var s in PosSetting.values) s: false,
  };

  void toggle(PosSetting key,) {
    settings[key] = !settings[key]!;
    update();
  }

  bool isEnabled(PosSetting key) => settings[key] ?? false;

  int posOrderTypeIndex = 0;
  void setPosOrderTypeIndex(int index){
    posOrderTypeIndex = index;
    update();
  }




}
  