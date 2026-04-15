import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:mighty_job/feature/human_resource/loan/domain/models/loan_body.dart';
import 'package:mighty_job/feature/human_resource/loan/domain/models/loan_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/widgets/user_selection_widget.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewLoanWidget extends StatefulWidget {
  final LoanItem? loanItem;
  const AddNewLoanWidget({super.key, this.loanItem});

  @override
  State<AddNewLoanWidget> createState() => _AddNewLoanWidgetState();
}

class _AddNewLoanWidgetState extends State<AddNewLoanWidget> {
  TextEditingController installmentController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.loanItem != null){
      Get.find<LoanController>();
      installmentController.text = widget.loanItem?.installments?.toString()??"0";
      paidAmountController.text = widget.loanItem?.paidAmount.toString()??'0';
      amountController.text = widget.loanItem?.amount?.toString()??"0";
      remarkController.text = widget.loanItem?.remarks??'';
      Get.find<UserController>().selectUser(UserItem(
        id: widget.loanItem?.employeeId?.toString(),
        firstName: widget.loanItem?.firstName,
        lastName: widget.loanItem?.lastName,
      ), notify: false);
      Get.find<DatePickerController>().setDateFromString(widget.loanItem?.startDate??'');
      Get.find<DatePickerController>().setEndDateFromString(widget.loanItem?.endDate??'');

      update = true;


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


        ResponsiveMasonryGrid(children: [

          SelectUserWidget(title: "employee".tr),

          DateSelectionWidget(title: "start_date".tr),

          ExpiryDateSelectionWidget(title: "end_date".tr),



          CustomTextField(title: "installment".tr,
            controller: installmentController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "installment".tr,),

          CustomTextField(title: "amount".tr,
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "amount".tr,),

          CustomTextField(title: "paid_amount".tr,
            controller: paidAmountController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "paid_amount".tr,),

          CustomTextField(title: "remark".tr,
            controller: remarkController,
            hintText: "remark".tr,),


        ]),



        controller.isLoading? const Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String? userId = Get.find<UserController>().selectedUserItem?.id;
              String installment = installmentController.text.trim();
              String startDate = Get.find<DatePickerController>().formatedFromDate;
              String endDate = Get.find<DatePickerController>().formatedToDate;
              String paidAmount = paidAmountController.text.trim();
              String amount = amountController.text.trim();
              String remark = remarkController.text.trim();



              if(installment.isEmpty){
                showCustomSnackBar("installment_is_empty".tr);
              }else if(userId== null){
                showCustomSnackBar("select_user".tr);
              }else if(amount.isEmpty){
                showCustomSnackBar("amount_is_empty".tr);
              }else if(paidAmount.isEmpty){
                showCustomSnackBar("paid_amount_is_empty".tr);
              }else if(remark.isEmpty){
                showCustomSnackBar("remark_is_empty".tr);
              }
              else{
                LoanBody body = LoanBody(
                  employeeId: int.parse(userId),
                    status: "active",
                    startDate: startDate,
                    endDate: endDate,
                    installments: int.parse(installment),
                    amount: amount,
                    paidAmount: paidAmount,
                    loanType: "personal",
                    remarks: remark,
                    method: update? "put" : "post"
                );
                if(update){
                  controller.updateLoan(body, int.parse(widget.loanItem!.id!));
                }else{
                  controller.createNewLoan(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
