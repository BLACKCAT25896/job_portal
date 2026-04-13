import 'package:get/get.dart';
import 'package:ecommerce/api_handle/api_checker.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/permission_model.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/role_body.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/role_model.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/repository/role_repository.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';

class RoleController extends GetxController implements GetxService{
  final RoleRepository roleRepository;
  RoleController({required this.roleRepository});




  bool isLoading = false;
  RoleModel? roleModel;
  Future<void> getRoleList(int offset) async {
    isLoading = true;
    Response? response = await roleRepository.getRoleList(offset);
    if (response?.statusCode == 200) {
      if(offset == 1){
        roleModel = RoleModel.fromJson(response?.body);
      }else{
        roleModel?.data?.data?.addAll(RoleModel.fromJson(response?.body).data!.data!);
        roleModel?.data?.currentPage = RoleModel.fromJson(response?.body).data?.currentPage;
        roleModel?.data?.total = RoleModel.fromJson(response?.body).data?.total;
      }
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }

  RoleItem? selectedRoleItem;
  void setRoleItem(RoleItem roleItem, {bool fromUser = false, bool notify = true}){
    selectedRoleItem = roleItem;
    if(fromUser){
      Get.find<UserController>().getUserList(1, userType: selectedRoleItem?.name??'customer');
    }
    if(notify) {
      update();
    }
  }



  Future<void> addNewRole(RoleBody roleBody) async {
    isLoading = true;
    update();
    Response? response = await roleRepository.createNewRole(roleBody);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("role_created_successfully".tr, isError: false);
      getRoleList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }

  Future<void> updateRole(RoleBody roleBody, int id) async {
    isLoading = true;
    update();
    Response? response = await roleRepository.updateRole(roleBody,id);
    if(response!.statusCode == 200){
      isLoading = false;
      Get.back();
      showCustomSnackBar("role_updated_successfully".tr, isError: false);
      getRoleList(1);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();

  }



  List<String> selectedPermissionIds = [];
  
  void selectPermission(PermissionItem permissionItem, {bool notify = true}) {
    int index = permissionModel!.data!.indexWhere((item) => item.id == permissionItem.id);
    if (index!= -1) {
      permissionModel!.data![index].isSelected =!permissionModel!.data![index].isSelected!;
    }
    if (selectedPermissionIds.contains(permissionItem.id!.toString())) {
      selectedPermissionIds.remove(permissionItem.id!.toString());
    } else {
      selectedPermissionIds.add(permissionItem.id!.toString());
    }
    if(notify){
      update();
    }
  }


  

  List<String?> permissionList = [];
  List<PermissionItem> permissionGroupList = [];
  List<List<PermissionItem>> permissionItemList = [];
  List<List<int>> permissionItemIndexList = [];
  PermissionModel? permissionModel;
  Future<void> getPermissionListList() async {
    isLoading = true;
    Response? response = await roleRepository.getPermissionList();
    if (response?.statusCode == 200) {
      isLoading = false;
      permissionModel = PermissionModel.fromJson(response?.body);
      if(permissionModel != null){

        for(PermissionItem cart in permissionModel!.data!) {
          if(!permissionList.contains(cart.name!.split("_")[0])) {
            permissionList.add(cart.name!.split("_")[0]);
            permissionGroupList.add(cart);
          }
        }
        for(String? seller in permissionList) {
          List<PermissionItem> cartLists = [];
          List<int> indexList = [];
          for(PermissionItem cart in permissionModel!.data!) {
            if(seller == cart.name!.split("_")[0]) {
              cartLists.add(cart);
              indexList.add(permissionModel!.data!.indexOf(cart));
            }
          }
          permissionItemList.add(cartLists);
          permissionItemIndexList.add(indexList);
        }
      }

    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }
}
