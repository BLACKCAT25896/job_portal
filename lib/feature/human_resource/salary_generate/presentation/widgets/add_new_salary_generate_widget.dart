
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/date_selection_widget.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/controller/salary_generate_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/models/salary_generate_body.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/domain/models/salary_generate_model.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/user_selection_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSalaryGenerateWidget extends StatefulWidget {
  final SalaryGenerateItem? salaryGenerateItem;
  const AddNewSalaryGenerateWidget({super.key, this.salaryGenerateItem});

  @override
  State<AddNewSalaryGenerateWidget> createState() => _AddNewSalaryGenerateWidgetState();
}

class _AddNewSalaryGenerateWidgetState extends State<AddNewSalaryGenerateWidget> {
  TextEditingController basicSalaryController = TextEditingController();
  TextEditingController totalEarningController = TextEditingController();
  TextEditingController totalDeductionController = TextEditingController();
  TextEditingController overtimeHourController = TextEditingController();
  TextEditingController overtimeAmountController = TextEditingController();
  TextEditingController netSalaryController = TextEditingController();

  TextEditingController basicController = TextEditingController();
  TextEditingController hraController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController bonusController = TextEditingController();
  TextEditingController overtimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.salaryGenerateItem != null){
      basicSalaryController.text = widget.salaryGenerateItem?.basicSalary.toString()??"0";
      totalEarningController.text = widget.salaryGenerateItem?.totalEarnings.toString()??'0';
      totalDeductionController.text = widget.salaryGenerateItem?.totalDeductions.toString()??'0';
      overtimeHourController.text = widget.salaryGenerateItem?.overtimeHours.toString()??'0';
      overtimeAmountController.text = widget.salaryGenerateItem?.overtimeAmount.toString()??'0';
      netSalaryController.text = widget.salaryGenerateItem?.netSalary.toString()??'0';
      basicController.text = widget.salaryGenerateItem?.salaryBreakdownModel?.basic.toString()??'0';
      hraController.text = widget.salaryGenerateItem?.salaryBreakdownModel?.hra.toString()??'0';
      transportationController.text = widget.salaryGenerateItem?.salaryBreakdownModel?.transport.toString()??'0';
      bonusController.text = widget.salaryGenerateItem?.salaryBreakdownModel?.bonus.toString()??'0';
      overtimeController.text = widget.salaryGenerateItem?.salaryBreakdownModel?.overtime.toString()??'0';
    Get.find<UserController>().selectUser(UserItem(
      id: widget.salaryGenerateItem?.employeeId.toString(),
      firstName: widget.salaryGenerateItem?.firstName,
      lastName: widget.salaryGenerateItem?.lastName,
    ), notify: false);

    }
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryGenerateController>(builder: (controller) {
        return Column(spacing: Dimensions.paddingSizeDefault, children: [
          ResponsiveMasonryGrid(children: [
            SelectUserWidget(title: "employee".tr),
            DateSelectionWidget(title: "month".tr),
            CustomTextField(title: "basic_salary".tr,
                hintText: "basic_salary".tr,
                controller: basicSalaryController),

            CustomTextField(
              controller: totalEarningController,
              title: "total_earning".tr,
              hintText: "total_earning".tr,
              inputFormatters: [AppConstants.numberFormat],
              inputType: TextInputType.number,
            ),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              hintText: "total_deduction".tr,
              controller: totalDeductionController,
              title: "total_deduction".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: overtimeHourController,
              title: "overtime_hour".tr,
              hintText: "overtime_hour".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: overtimeAmountController,
              title: "overtime_amount".tr,
              hintText: "overtime_amount".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: netSalaryController,
              title: "net_salary".tr,
              hintText: "net_salary".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: basicController,
              title: "basic".tr,
              hintText: "basic".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: hraController,
              title: "hra".tr,
              hintText: "hra".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: transportationController,
              title: "transportation".tr,
              hintText: "transportation".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: taxController,
              title: "tax".tr,
              hintText: "tax".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: bonusController,
              title: "bonus".tr,
              hintText: "bonus".tr),
            CustomTextField(
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
              controller: overtimeController,
              title: "overtime".tr,
              hintText: "overtime".tr
            )
          ]),

          controller.isLoading? Center(child: CircularProgressIndicator()):
          CustomButton(onTap: (){
            String basicSalary = basicSalaryController.text.trim();
            String totalEarning = totalEarningController.text.trim();
            String totalDeduction = totalDeductionController.text.trim();
            String overtimeHour = overtimeHourController.text.trim();
            String overtimeAmount = overtimeAmountController.text.trim();
            String netSalary = netSalaryController.text.trim();
            String basic = basicController.text.trim();
            String hra = hraController.text.trim();
            String transportation = transportationController.text.trim();
            String tax = taxController.text.trim();
            String bonus = bonusController.text.trim();
            String overtime = overtimeController.text.trim();
            String? employeeId = Get.find<UserController>().selectedUserItem?.id;
            final dateController = Get.find<DatePickerController>();

            String? month;
            if (dateController.formatedFromDate.contains('-')) {
              month = dateController.formatedFromDate.substring(0, dateController.formatedFromDate.lastIndexOf('-'));
            }

            if(employeeId == null){
              showCustomSnackBar("select_employee".tr);
            }
            else if(basicSalary.isEmpty){
              showCustomSnackBar("basic_salary_is_empty".tr);
            }else if(netSalary.isEmpty){
              showCustomSnackBar("net_salary_is_empty".tr);
            }
            else if(totalEarning.isEmpty){
              showCustomSnackBar("total_earning_is_empty".tr);
            }else{
              SalaryGenerateBody body = SalaryGenerateBody(
                employeeId: int.parse(employeeId),
                month:month,
                basicSalary: basicSalary,
                totalEarnings: totalEarning,
                totalDeductions: totalDeduction,
                overtimeHours: overtimeHour,
                overtimeAmount: overtimeAmount,
                netSalary: netSalary,
                salaryBreakdown: SalaryBreakdown(
                    basic: basic,
                    hra: hra,
                    transport: transportation,
                    tax: tax,
                    bonus: bonus,
                    overtime: overtime
                ),
                status: "approved",

              );
              if(widget.salaryGenerateItem != null){
                controller.updateSalaryGenerate(body, widget.salaryGenerateItem!.id!);
              }else {
                controller.createNewSalaryGenerate(body);
              }
            }
          }, text: "confirm".tr)

        ]);
      }
    );
  }
}
