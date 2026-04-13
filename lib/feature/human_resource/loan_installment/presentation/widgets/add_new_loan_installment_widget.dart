import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/date_selection_widget.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/models/loan_model.dart';
import 'package:ecommerce/feature/human_resource/loan/presentation/widgets/loan_selection_widget.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/controller/loan_installment_controller.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_body.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/domain/models/loan_installment_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewLoanInstallmentWidget extends StatefulWidget {
  final LoanInstallmentItem? loanInstallmentItem;
  const AddNewLoanInstallmentWidget({super.key, this.loanInstallmentItem});

  @override
  State<AddNewLoanInstallmentWidget> createState() => _AddNewLoanInstallmentWidgetState();
}

class _AddNewLoanInstallmentWidgetState extends State<AddNewLoanInstallmentWidget> {
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.loanInstallmentItem != null){
      final controller = Get.find<LoanController>();
      amountController.text = widget.loanInstallmentItem?.amount?.toString()??"0";
      remarkController.text = widget.loanInstallmentItem?.remarks??'';
      Get.find<DatePickerController>().setDateFromString(widget.loanInstallmentItem?.dueDate??'');
      controller.selectLoan(LoanItem(id: widget.loanInstallmentItem?.loanId.toString(),
      firstName: widget.loanInstallmentItem?.firstName,
      lastName: widget.loanInstallmentItem?.lastName), notify: false);
      update = true;


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanInstallmentController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


        ResponsiveMasonryGrid(children: [

          SelectLoanWidget(),

          DateSelectionWidget(title: "due_date".tr),


          CustomTextField(title: "amount".tr,
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "amount".tr,),


          CustomTextField(title: "remark".tr,
            controller: remarkController,
            hintText: "remark".tr,),


        ]),



        controller.isLoading? const Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String? loanId = Get.find<LoanController>().selectedLoanItem?.id;
              String startDate = Get.find<DatePickerController>().formatedFromDate;
              String amount = amountController.text.trim();
              String remark = remarkController.text.trim();


              if(loanId== null){
                showCustomSnackBar("select_loan".tr);
              }else if(amount.isEmpty){
                showCustomSnackBar("amount_is_empty".tr);
              }else if(remark.isEmpty){
                showCustomSnackBar("remark_is_empty".tr);
              }
              else{
                LoanInstallmentBody body = LoanInstallmentBody(
                  loanId: int.parse(loanId),
                    dueDate: startDate,
                    amount: amount,
                    remarks: remark,
                    method: update? "put" : "post"
                );
                if(update){
                  controller.updateLoanInstallment(body, int.parse(widget.loanInstallmentItem!.id!));
                }else{
                  controller.createNewLoanInstallment(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
