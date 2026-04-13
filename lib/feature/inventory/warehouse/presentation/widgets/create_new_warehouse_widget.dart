
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/inventory/warehouse/domain/model/warehouse_body.dart';
import 'package:ecommerce/feature/inventory/warehouse/domain/model/warehouse_model.dart';
import 'package:ecommerce/feature/inventory/warehouse/logic/warehouse_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewWarehouseWidget extends StatefulWidget {
  final WarehouseItem? warehouseItem;
  const CreateNewWarehouseWidget({super.key, this.warehouseItem});

  @override
  State<CreateNewWarehouseWidget> createState() => _CreateNewWarehouseWidgetState();
}

class _CreateNewWarehouseWidgetState extends State<CreateNewWarehouseWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  TextEditingController capacityController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.warehouseItem != null){
      update = true;
      nameController.text = widget.warehouseItem?.name??'';
      emailController.text = widget.warehouseItem?.email??'';
      phoneController.text = widget.warehouseItem?.phone??'';
      addressController.text = widget.warehouseItem?.address??'';
      managerController.text = widget.warehouseItem?.managerName??'';
      cityController.text = widget.warehouseItem?.city??'';
      stateController.text = widget.warehouseItem?.state??'';
      countryController.text = widget.warehouseItem?.country??'';
      postalCodeController.text = widget.warehouseItem?.postalCode??'';
      latController.text = widget.warehouseItem?.latitude.toString()??'';
      lngController.text = widget.warehouseItem?.longitude.toString()??'';
      capacityController.text = widget.warehouseItem?.capacity.toString()??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarehouseController>(builder: (warehouseController) {
      return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(
          child: CustomContainer(showShadow: false, borderRadius: 5,
            child: Column(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeDefault,  children: [


                ResponsiveMasonryGrid(width: 250, children: [
                  CustomTextField(title: "name".tr,
                    controller: nameController,
                    hintText: "enter_name".tr,),

                  CustomTextField(title: "email".tr,
                    controller: emailController,
                    hintText: "email".tr,),

                  CustomTextField(title: "phone".tr,
                    controller: phoneController,
                    inputType: TextInputType.phone,
                    inputFormatters: [AppConstants.phoneNumberFormat],
                    hintText: "phone".tr,),
                  CustomTextField(title: "address".tr,
                    controller: addressController,
                    hintText: "address".tr,),
                  CustomTextField(title: "manager_name".tr,
                    controller: managerController,
                    hintText: "manager_name".tr,),
                  CustomTextField(title: "city".tr,
                    controller: cityController,
                    hintText: "city".tr,),
                  CustomTextField(title: "state".tr,
                    controller: stateController,
                    hintText: "state".tr,),
                  CustomTextField(title: "country".tr,
                    controller: countryController,
                    hintText: "country".tr,),
                  CustomTextField(title: "postal_code".tr,
                    controller: postalCodeController,
                    hintText: "postal_code".tr,),
                  CustomTextField(title: "latitude".tr,
                    controller: latController,
                    hintText: "latitude".tr,),
                  CustomTextField(title: "longitude".tr,
                    controller: lngController,
                    hintText: "longitude".tr,),
                  CustomTextField(title: "capacity".tr,
                    controller: capacityController,
                    inputType: TextInputType.number,
                    inputFormatters: [AppConstants.numberFormat],
                    hintText: "capacity".tr,),

                ]),


                  warehouseController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Center(child: CircularProgressIndicator())):

                  Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                      child: CustomButton(onTap: (){
                        String name = nameController.text.trim();
                        String email = emailController.text.trim();
                        String phone = phoneController.text.trim();
                        String address = addressController.text.trim();
                        String managerName = managerController.text.trim();
                        String city = cityController.text.trim();
                        String state = stateController.text.trim();
                        String country = countryController.text.trim();
                        String postalCode = postalCodeController.text.trim();
                        String lat = latController.text.trim();
                        String lng = lngController.text.trim();
                        String capacity = capacityController.text.trim();


                        if(name.isEmpty){
                          showCustomSnackBar("name_is_empty".tr);
                        }
                        else if(email.isEmpty){
                          showCustomSnackBar("short_name_is_empty".tr);
                        }else if(phone.isEmpty){
                          showCustomSnackBar("phone_is_empty".tr);
                        }else if(address.isEmpty){
                          showCustomSnackBar("address_is_empty".tr);
                        }else if(managerName.isEmpty){
                          showCustomSnackBar("manager_name_is_empty".tr);
                        }else if(city.isEmpty){
                          showCustomSnackBar("city_is_empty".tr);
                        }else if(state.isEmpty){
                          showCustomSnackBar("state_is_empty".tr);
                        }else if(country.isEmpty){
                          showCustomSnackBar("country_is_empty".tr);
                        }else if(postalCode.isEmpty){
                          showCustomSnackBar("postal_code_is_empty".tr);
                        }else if(lat.isEmpty){
                          showCustomSnackBar("lat_is_empty".tr);
                        }else if(lng.isEmpty){
                          showCustomSnackBar("lng_is_empty".tr);
                        }else if(capacity.isEmpty){
                          showCustomSnackBar("capacity_is_empty".tr);
                        }
                        else{
                          WarehouseBody body = WarehouseBody(
                            name: name,
                            slug: name.toLowerCase().replaceAll(" ", "-"),
                            email: email,
                            phone: phone,
                            address: address,
                            managerName: managerName,
                            city: city,
                            state: state,
                            country: country,
                            postalCode: postalCode,
                            latitude: lat,
                            longitude: lng,
                            capacity: int.parse(capacity),
                            isDefault: 0,
                            status: "active");
                          if(update){
                            warehouseController.editWarehouse(body, widget.warehouseItem!.id!);
                          }else{
                            warehouseController.createWarehouse(body);
                          }
                        }
                      }, text: update? "update".tr : "save".tr))
                ],),
          ),
            ),
          );
        }
    );
  }
}
