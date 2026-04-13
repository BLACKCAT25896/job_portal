
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/tax_management/tax/domain/model/tax_body.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/tax_management/tax/domain/model/tax_model.dart';
import 'package:ecommerce/feature/tax_management/tax/logic/tax_controller.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewTaxWidget extends StatefulWidget {
  final TaxItem? taxItem;
  const CreateNewTaxWidget({super.key, this.taxItem});

  @override
  State<CreateNewTaxWidget> createState() => _CreateNewTaxWidgetState();
}

class _CreateNewTaxWidgetState extends State<CreateNewTaxWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.taxItem != null){
      update = true;
      nameController.text = widget.taxItem?.name??'';
      registrationController.text = widget.taxItem?.regNo??'';
      valueController.text = widget.taxItem?.value??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxController>(builder: (taxController) {
          return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeDefault,  children: [

               ResponsiveMasonryGrid(children: [
                 CustomTextField(title: "name".tr,
                   controller: nameController,
                   hintText: "enter_name".tr,),

                 CustomTextField(
                   controller: registrationController,
                   hintText: "registration".tr,
                   title: "registration".tr,
                 ),

                 CustomTextField(
                   controller: valueController,
                   hintText: "value".tr,
                   inputFormatters: [AppConstants.numberFormat],
                   inputType: TextInputType.number,
                   title: "value".tr,
                 ),
               ]),

                taxController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                    child: CustomButton(onTap: (){
                      String name = nameController.text.trim();
                      String registration = registrationController.text.trim();
                      String value = valueController.text.trim();

                      if(name.isEmpty){
                        showCustomSnackBar("name_is_empty".tr);
                      }else if(registration.isEmpty){
                        showCustomSnackBar("registration_is_empty".tr);
                      }else if(value.isEmpty){
                        showCustomSnackBar("value_is_empty".tr);
                      }
                      else{
                        TaxBody body = TaxBody(
                          name: name,
                          regNo: registration,
                          value: value,
                          type: "percentage",
                          status: 1,
                          method: update? "put" : "post",
                          isDefault: true);
                        if(update){
                          taxController.editTax(body, widget.taxItem!.id!);
                        }else{
                          taxController.createTax(body);
                        }
                      }
                    }, text: update? "update".tr : "save".tr))
              ],),
            ),
          );
        }
    );
  }
}
