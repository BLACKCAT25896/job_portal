import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_body.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/domain/models/salary_setup_model.dart';
import 'package:mighty_job/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:mighty_job/feature/human_resource/salary_type/domain/models/salary_type_model.dart';
import 'package:mighty_job/feature/human_resource/salary_type/presentation/widgets/salary_type_selection_widget.dart';
import 'package:mighty_job/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/widgets/user_selection_widget.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/salary_setup/controller/salary_setup_controller.dart';

class AddNewSalarySetupWidget extends StatefulWidget {
  final SalarySetupItem? salarySetupItem;
  const AddNewSalarySetupWidget({super.key, this.salarySetupItem});

  @override
  State<AddNewSalarySetupWidget> createState() => _AddNewSalarySetupWidgetState();
}

class _AddNewSalarySetupWidgetState extends State<AddNewSalarySetupWidget> {
  TextEditingController noteController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.salarySetupItem != null){
      noteController.text = widget.salarySetupItem?.notes??'';
      amountController.text = widget.salarySetupItem?.amount?.toString()??"0";

      Get.find<UserController>().selectUser(UserItem(
        id: widget.salarySetupItem?.employeeId?.toString(),
        firstName: widget.salarySetupItem?.firstName??'',
        lastName: widget.salarySetupItem?.lastName??''), notify: false);

      Get.find<SalaryTypeController>().selectSalaryType(SalaryTypeItem(
        id: widget.salarySetupItem?.salaryTypeId?.toString(),
        name: widget.salarySetupItem?.salaryTypeName??''), notify: false);

      update = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalarySetupController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


        ResponsiveMasonryGrid(children: [


          SelectUserWidget(title: "employee".tr),
          SelectSalaryTypeWidget(),
          CustomTextField(title: "amount".tr,
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "amount".tr,),

          CustomTextField(title: "notes".tr,
            controller: noteController,
            hintText: "notes".tr,),



        ]),



        controller.isLoading? const Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String amount = amountController.text.trim();
              String notes = noteController.text.trim();
              String? employeeId = Get.find<UserController>().selectedUserItem?.id;
              String? salaryTypeId = Get.find<SalaryTypeController>().selectedSalaryTypeItem?.id;

              if(amount.isEmpty){
                showCustomSnackBar("amount_is_empty".tr);
              }else if(employeeId == null){
                showCustomSnackBar("select_employee".tr);
              }else if(salaryTypeId == null){
                showCustomSnackBar("select_salary_type".tr);
              }
              else{
                SalarySetupBody body = SalarySetupBody(
                    amount: amount,
                    employeeId: int.parse(employeeId),
                    salaryTypeId: int.parse(salaryTypeId),
                    status: 1,
                    notes: notes,
                    calculationType: "fixed",
                    method: update? "put" : "post"
                );
                if(update){
                  controller.updateSalarySetup(body, widget.salarySetupItem!.id!);
                }else{
                  controller.createNewSalarySetup(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
