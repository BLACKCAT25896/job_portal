import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_body.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewInquiryWidget extends StatefulWidget {
  final InquiryItem? inquiryItem;
  const AddNewInquiryWidget({super.key, this.inquiryItem});

  @override
  State<AddNewInquiryWidget> createState() => _AddNewInquiryWidgetState();
}

class _AddNewInquiryWidgetState extends State<AddNewInquiryWidget> {
  TextEditingController nameController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.inquiryItem != null){
      update = true;
      nameController.text = widget.inquiryItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquiryController>(builder: (inquiryController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: inquiryController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }
                  else{
                    InquiryBody inquiryBody = InquiryBody(
                        name: name,
                        sMethod: update? "put":"POST");
                    if(update){
                      inquiryController.updateInquiry(inquiryBody, widget.inquiryItem!.id!);
                    }else{
                      inquiryController.createNewInquiry(inquiryBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
