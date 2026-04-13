import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/human_resource/award/controller/award_controller.dart';
import 'package:ecommerce/feature/human_resource/award/domain/models/award_body.dart';
import 'package:ecommerce/feature/human_resource/award/domain/models/award_model.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/user_selection_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewAwardScreen extends StatefulWidget {
  final AwardItem? awardItem;
  const CreateNewAwardScreen({super.key, this.awardItem});

  @override
  State<CreateNewAwardScreen> createState() => _CreateNewAwardScreenState();
}

class _CreateNewAwardScreenState extends State<CreateNewAwardScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();


   bool update = false;
  @override
  void initState() {
    if(widget.awardItem != null){
      update = true;
      titleController.text = widget.awardItem?.title??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AwardController>(builder: (awardController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [


          SelectUserWidget(userType: "Employee",),

          CustomTextField(controller: titleController, hintText: "title".tr,
          title: "title".tr),
          CustomTextField(hintText: "description".tr, title: "description".tr,
          controller: descriptionController),

          CustomTextField(controller: amountController,
          inputFormatters: [AppConstants.numberFormat],
          inputType: TextInputType.number,
          hintText: "amount", title: "amount".tr),



          awardController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String title = titleController.text.trim();
              String? employeeId = Get.find<UserController>().selectedUserItem?.id;
              String? description = descriptionController.text.trim();
              String amount = amountController.text.trim();
              String date = Get.find<DatePickerController>().formatedFromDate;
              String type = "cash";

              if(title.isEmpty){
                showCustomSnackBar("title_is_empty".tr);
              }
              else if(employeeId == null){
                showCustomSnackBar("select_employee".tr);
              }else if(amount.isEmpty){
                showCustomSnackBar("amount_is_empty".tr);
              }else if(double.parse(amount) <= 0){
                showCustomSnackBar("invalid_amount".tr);
              }
              else{
                AwardBody body = AwardBody(
                  title: title,
                  employeeId: int.parse(employeeId),
                  description: description,
                  amount: amount,
                  awardType: type,
                  dateAwarded: date
                );
                if(update){
                  awardController.updateAward(body,  int.parse(widget.awardItem!.id!));
                }else{
                  awardController.createNewAward(body);
                }

              }
            }, text: update? "update".tr : "save".tr))
        ],);
      }
    );
  }
}
