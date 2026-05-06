import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/package_plan/controller/package_controller.dart';
import 'package:mighty_job/feature/package_plan/domain/models/package_model.dart';
import 'package:mighty_job/feature/package_plan/presentation/screens/create_new_package_screen.dart';
import 'package:mighty_job/util/dimensions.dart';

class PackageItemWidget extends StatelessWidget {
  final PackageItem? packageItem;
  final int index;
  const PackageItemWidget({super.key, this.packageItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: CustomItemTextWidget(text:"${packageItem?.name}")),
        Expanded(child: CustomItemTextWidget(text: "${packageItem?.durationDays?.toString()??'0'} ${"days".tr}")),
        EditDeleteSection(isHorizontal: true, onEdit: (){
          Get.dialog(CustomDialogWidget(title: "package".tr,
              child: CreateNewPackageScreen(packageItem: packageItem)));
        },
          onDelete: (){
          Get.dialog(ConfirmationDialog(
            title: "subscription_plan",
              content: "subscription_plan".tr,
              onTap: (){
            Get.back();
            Get.find<PackageController>().deletePackage(packageItem!.id!);
          }));

        },)
      ],);
  }
}