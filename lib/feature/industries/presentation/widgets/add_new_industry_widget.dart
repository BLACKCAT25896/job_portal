import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/industries/controller/industry_controller.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_body.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewIndustryWidget extends StatefulWidget {
  final IndustryItem? industryItem;
  const AddNewIndustryWidget({super.key, this.industryItem});

  @override
  State<AddNewIndustryWidget> createState() => _AddNewIndustryWidgetState();
}

class _AddNewIndustryWidgetState extends State<AddNewIndustryWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.industryItem != null){
      update = true;
      nameController.text = widget.industryItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndustryController>(builder: (industryController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: industryController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    IndustryBody industryBody = IndustryBody(
                        name: name,
                        method: update? "put":"POST",
                        status: 1);
                    if(update){
                      industryController.updateIndustry(industryBody, widget.industryItem!.id!);
                    }else{
                      industryController.createNewIndustry(industryBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
