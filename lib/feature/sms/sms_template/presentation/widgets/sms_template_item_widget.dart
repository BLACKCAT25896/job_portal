import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/sms/sms_template/controller/sms_template_controller.dart';
import 'package:mighty_job/feature/sms/sms_template/domain/models/sms_template_model.dart';
import 'package:mighty_job/feature/sms/sms_template/presentation/screens/create_new_sms_template_screen.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SmsTemplateItemWidget extends StatelessWidget {
  final SmsTemplateItem? smsTemplateItem;
  final int index;
  const SmsTemplateItemWidget({super.key, this.smsTemplateItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: Text("${smsTemplateItem?.name}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),
      Expanded(child: Text("${smsTemplateItem?.description}",maxLines: 1, overflow: TextOverflow.ellipsis, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),
      EditDeleteSection(isHorizontal: true, onEdit: (){
        Get.dialog(CreateNewSmsTemplateScreen(smsTemplateItem: smsTemplateItem));
      },
        onDelete: (){
          Get.find<SmsTemplateController>().deleteSmsTemplate(smsTemplateItem!.id!);
        },)
    ],
    ):
    CustomContainer(borderRadius: Dimensions.paddingSizeExtraSmall, child: Row(children: [
        Expanded(child: Text("${smsTemplateItem?.name}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),
        Expanded(child: Text("${smsTemplateItem?.description}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),
        EditDeleteSection(isHorizontal: true, onEdit: (){
          Get.dialog(CreateNewSmsTemplateScreen(smsTemplateItem: smsTemplateItem));
        },
          onDelete: (){
          Get.find<SmsTemplateController>().deleteSmsTemplate(smsTemplateItem!.id!);
        },)
      ],
    ));
  }
}