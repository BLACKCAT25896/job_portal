import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_checkbox.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_body.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSalaryTypeWidget extends StatefulWidget {
  final SalaryTypeItem? salaryTypeItem;
  const AddNewSalaryTypeWidget({super.key, this.salaryTypeItem});

  @override
  State<AddNewSalaryTypeWidget> createState() => _AddNewSalaryTypeWidgetState();
}

class _AddNewSalaryTypeWidgetState extends State<AddNewSalaryTypeWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.salaryTypeItem != null){
      final controller = Get.find<SalaryTypeController>();
      nameController.text = widget.salaryTypeItem?.name??'';
      amountController.text = widget.salaryTypeItem?.defaultAmount?.toString()??"0";
      controller.toggleIsTaxable(widget.salaryTypeItem?.isTaxable == "1", notify: false);
      controller.toggleIsVisibleInPayslip(widget.salaryTypeItem?.isVisibleInPayslip == "1", notify: false);
      update = true;


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryTypeController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


        ResponsiveMasonryGrid(children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "name".tr,),


          CustomTextField(title: "amount".tr,
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "amount".tr,),
          CustomCheckbox(value: controller.isTaxable, title: "is_taxable".tr,
              onChange: ()=> controller.toggleIsTaxable(!controller.isTaxable)),

          CustomCheckbox(value: controller.isVisibleInPayslip, title: "is_visible_in_payslip".tr,
              onChange: ()=> controller.toggleIsVisibleInPayslip(!controller.isVisibleInPayslip)),



        ]),



        controller.isLoading? const Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String amount = amountController.text.trim();
              String name = nameController.text.trim();

              if(amount.isEmpty){
                showCustomSnackBar("amount_is_empty".tr);
              }else if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                SalaryTypeBody body = SalaryTypeBody(
                  name: name,
                    defaultAmount: amount,
                    isTaxable: controller.isTaxable,
                    isVisibleInPayslip: controller.isVisibleInPayslip,
                    type: "earning",
                    status: 1,
                    calculationMethod: "fixed",

                    method: update? "put" : "post"
                );
                if(update){
                  controller.updateSalaryType(body, int.parse(widget.salaryTypeItem!.id!));
                }else{
                  controller.createNewSalaryType(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
