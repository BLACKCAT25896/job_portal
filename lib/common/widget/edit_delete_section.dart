import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/theme_controller.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';

class EditDeleteSection extends StatelessWidget {
  final Function()? onEdit;
  final Function()? onDelete;
  final Function()? onDownload;
  final bool isHorizontal;
  const EditDeleteSection({super.key, this.onEdit, this.onDelete, this.isHorizontal = false, this.onDownload});

  @override
  Widget build(BuildContext context) {
    bool darkTheme = Get.find<ThemeController>().darkTheme;
    return isHorizontal?
        Row(children: [
          if(onEdit != null)
            InkWell(onTap: onEdit,
                child: SizedBox(width: 20,child: Image.asset(Images.edit, color:  darkTheme? Colors.white : Colors.black,))),

          if(onDelete != null && onEdit != null)
            const SizedBox(width: Dimensions.paddingSizeLarge),
          if(onDelete != null)
            InkWell(onTap: onDelete,
                child: SizedBox(width: 20,child: Image.asset(Images.delete))),

          if(onDelete != null && onDownload != null)
            const SizedBox(width: Dimensions.paddingSizeDefault),
          if(onDownload != null)
            InkWell(onTap: onDownload,
                child: SizedBox(width: 16 , child: Image.asset(Images.downloadIcon, color: Theme.of(context).textTheme.displayLarge?.color,))),

        ]):
    Column(children: [
      if(onEdit != null)
      InkWell(onTap: onEdit,
          child: CustomContainer(borderRadius: 3, horizontalPadding: 7, verticalPadding: 7,
              width: 30,child: Image.asset(Images.edit, color:  darkTheme? Colors.white : Colors.black,))),

      if(onDelete != null && onEdit != null)
      const SizedBox(height: Dimensions.paddingSizeDefault),
      if(onDelete != null)
      InkWell(onTap: onDelete,
          child: CustomContainer(borderRadius: 3, horizontalPadding: 7, verticalPadding: 7,
              width: 30, child: Image.asset(Images.delete, color: Theme.of(context).textTheme.displayLarge?.color,))),

      if(onDelete != null && onDownload != null)
        const SizedBox(height: Dimensions.paddingSizeDefault),
      if(onDownload != null)
        InkWell(onTap: onDownload,
            child: CustomContainer(borderRadius: 3, horizontalPadding: 7, verticalPadding: 7,
                width: 30, child: Image.asset(Images.downloadIcon, color: Theme.of(context).textTheme.displayLarge?.color,))),

      if(onDelete == null && onDownload == null && onEdit == null)
        const SizedBox(width: 50),

    ],);
  }
}
