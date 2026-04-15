import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/ticket_category_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddTicketCategoryWidget extends StatefulWidget {
  final TicketCategoryItem? item;
  const AddTicketCategoryWidget({super.key, this.item});

  @override
  State<AddTicketCategoryWidget> createState() => _AddTicketCategoryWidgetState();
}

class _AddTicketCategoryWidgetState extends State<AddTicketCategoryWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    if(widget.item != null){
      nameController.text = widget.item?.name??'';
      descriptionController.text = widget.item?.description??'';
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(builder: (supportTicketController) {
      return Padding(padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault),
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(mainAxisSize: MainAxisSize.min, children: [

            CustomTextField(
              inputAction: TextInputAction.next,
              title: 'title'.tr,
              hintText: "enter_title".tr,
              controller: nameController,),


            CustomTextField(
                inputAction: TextInputAction.newline,
                hintText: "description".tr,
                inputType: TextInputType.multiline,
                controller: descriptionController,
                title: 'description'.tr,
                maxLines: 5),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),


            GetBuilder<SupportTicketController>(builder: (supportTicketController) {
              return supportTicketController.isLoading ?
              Center(child: CircularProgressIndicator()):
              Padding(padding: const EdgeInsets.symmetric(
                  horizontal : Dimensions.paddingSizeDefault,
                  vertical: Dimensions.paddingSizeSmall),
                child: CustomButton(text: "confirm".tr, onTap: () {
                  String title = nameController.text.trim();
                  String description = descriptionController.text.trim();

                  if (title.isEmpty) {
                    showCustomSnackBar("title_required".tr);
                  } else {
                    if(widget.item != null){
                      supportTicketController.editTicketCategoryList(
                          title, description, widget.item!.id!);
                    }else {
                      supportTicketController.addTicketCategory(title, description);
                    }
                  }
                }));
            })
          ]),),
      );
    });
  }
}
