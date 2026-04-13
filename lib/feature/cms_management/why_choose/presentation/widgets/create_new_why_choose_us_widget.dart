import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/cms_management/why_choose/domain/model/why_choose_body.dart';
import 'package:ecommerce/feature/cms_management/why_choose/domain/model/why_choose_model.dart';
import 'package:ecommerce/feature/cms_management/why_choose/logic/why_choose_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewWhyChooseUsWidget extends StatefulWidget {
  final WhyChooseItem? whyChooseUsItem;
  const CreateNewWhyChooseUsWidget({super.key, this.whyChooseUsItem});

  @override
  State<CreateNewWhyChooseUsWidget> createState() => _CreateNewWhyChooseUsWidgetState();
}

class _CreateNewWhyChooseUsWidgetState extends State<CreateNewWhyChooseUsWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    if(widget.whyChooseUsItem != null) {
      titleController.text = widget.whyChooseUsItem?.title??'';
      descriptionController.text = widget.whyChooseUsItem?.description??'';
     

    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhyChooseController>(
      builder: (conceptualController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          ImagePickerWidget(onImagePicked: ()=> conceptualController.pickImage(),
            pickedFile: conceptualController.thumbnail,
            imageUrl: "${AppConstants.baseUrl}/public/storage/why_choose/${widget.whyChooseUsItem?.icon??''}",),
          CustomTextField(title: "title".tr, hintText: "title".tr, controller: titleController, maxLength: 100),
          CustomTextField(title: "description".tr, minLines: 3, maxLines: 5, inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
              hintText: "description".tr, controller: descriptionController, maxLength: 255),


          SizedBox(height: Dimensions.paddingSizeLarge),
          conceptualController.loading? const Center(child: CircularProgressIndicator()) :
          CustomButton(
            onTap: () {
              String title = titleController.text.trim();
              String description = descriptionController.text.trim();
              WhyChooseBody body = WhyChooseBody(
                title: title,
                description: description,
                method: widget.whyChooseUsItem != null? "PUT" :"POST",
              );
              if(widget.whyChooseUsItem != null){

                conceptualController.editWhyChooseUs(body, widget.whyChooseUsItem!.id!);
              }else {
                conceptualController.createWhyChooseUs(body);
              }

            },
            text: widget.whyChooseUsItem != null?"update".tr : "add".tr,
          ),
        ]);
      }
    );
  }

}