import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_ticket_body.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddTicketWidget extends StatefulWidget {
  const AddTicketWidget({super.key});

  @override
  State<AddTicketWidget> createState() => _AddTicketWidgetState();
}

class _AddTicketWidgetState extends State<AddTicketWidget> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _subjectNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketController>(builder: (supportTicketController) {
      return Column(children: [

        CustomTextField(
          focusNode: _subjectNode,
          nextFocus: _descriptionNode,
          inputAction: TextInputAction.next,
          title: 'title'.tr,
          hintText: "enter_title".tr,
          controller: _subjectController,),


        CustomTextField(
            focusNode: _descriptionNode,
            inputAction: TextInputAction.newline,
            hintText: "description".tr,
            inputType: TextInputType.multiline,
            controller: _descriptionController,
            title: 'description'.tr,
            maxLines: 5),
        const SizedBox(height: Dimensions.paddingSizeExtraLarge),

        GetBuilder<SupportTicketController>(builder: (supportTicketController) {
          return supportTicketController.isLoading ?
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(width: 40, height: 40,
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(systemPrimaryColor()))),
          ]):

          Container(color: Theme.of(context).cardColor,
            child: Padding(padding: const EdgeInsets.symmetric(
                horizontal : Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeSmall),
              child: CustomButton(text: "confirm".tr, onTap: () {
                int? categoryId = supportTicketController.selectedTicketCategory?.id;
                String title = _subjectController.text.trim();
                String message = _descriptionController.text.trim();
                String priority = supportTicketController.selectedPriority;

                if (title.isEmpty) {
                  showCustomSnackBar("title_required".tr);
                } else if (_descriptionController.text.isEmpty) {
                  showCustomSnackBar("message_required".tr);
                } else {
                  TicketBody supportTicketModel = TicketBody(title: title,
                      ticketCategoryId :categoryId,
                      description: message, priority: priority);
                  supportTicketController.createSupportTicket(supportTicketModel);
                }
              })),
          );
        })
      ]);
    });
  }
}
