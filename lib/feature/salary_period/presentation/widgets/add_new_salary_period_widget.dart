import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_body.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSalaryPeriodWidget extends StatefulWidget {
  final SalaryPeriodItem? salaryPeriodItem;
  const AddNewSalaryPeriodWidget({super.key, this.salaryPeriodItem});

  @override
  State<AddNewSalaryPeriodWidget> createState() => _AddNewSalaryPeriodWidgetState();
}

class _AddNewSalaryPeriodWidgetState extends State<AddNewSalaryPeriodWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.salaryPeriodItem != null){
      update = true;
      nameController.text = widget.salaryPeriodItem?.period??'';
      descriptionController.text = widget.salaryPeriodItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryPeriodController>(builder: (salaryPeriodController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

         ResponsiveMasonryGrid(children: [
           CustomTextField(title: "name".tr,
             controller: nameController,
             hintText: "enter_name".tr,),
           CustomTextField(title: "description".tr,
             controller: descriptionController,
             hintText: "description".tr,),

         ]),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: salaryPeriodController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  String description = descriptionController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else if(description.isEmpty){
                    showCustomSnackBar("code_is_empty".tr);
                  }
                  else{
                    SalaryPeriodBody salaryPeriodBody = SalaryPeriodBody(
                        period: name,
                        description: description,
                        isDefault: true,
                        sMethod: update? "put":"POST",
                        status: true);
                    if(update){
                      salaryPeriodController.updateSalaryPeriod(salaryPeriodBody, widget.salaryPeriodItem!.id!);
                    }else{
                      salaryPeriodController.createNewSalaryPeriod(salaryPeriodBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
