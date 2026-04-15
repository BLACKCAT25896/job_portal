import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/sms/phone_book/controller/phone_book_controller.dart';
import 'package:mighty_job/feature/sms/phone_book/domain/models/phone_book_model.dart';
import 'package:mighty_job/feature/sms/phone_book/presentation/screens/create_new_phone_book_screen.dart';
import 'package:mighty_job/util/dimensions.dart';

class PhoneBookItemWidget extends StatelessWidget {
  final PhoneBookItem? phoneBookItem;
  final int index;
  const PhoneBookItemWidget({super.key, this.phoneBookItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: CustomItemTextWidget(text: "${phoneBookItem?.name}")),
        Expanded(child: CustomItemTextWidget(text: "${phoneBookItem?.phone}", )),
        Expanded(child: CustomItemTextWidget(text: "${phoneBookItem?.category?.name}")),


        EditDeleteSection(isHorizontal: true, onEdit: (){
          Get.dialog(CreateNewPhoneBookScreen(phoneBookItem: phoneBookItem));
        },
          onDelete: (){
          Get.dialog(ConfirmationDialog(title: "phone_book",
              content: "phone_book",
              onTap: (){
            Get.back();
            Get.find<PhoneBookController>().deletePhoneBook(phoneBookItem!.id!);
          }));
        },)
      ],
    );
  }
}