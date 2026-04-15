

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';

class EditDeleteBottomSection extends StatelessWidget {
  final Function()? edit;
  final Function()? delete;
  const EditDeleteBottomSection({super.key, this.edit, this.delete});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if(delete != null)
      Expanded(child: CustomButton(onTap: delete,
        buttonColor: Theme.of(context).colorScheme.error,
        textColor: Colors.white,
        text: "delete".tr, icon: const Icon(CupertinoIcons.delete, color: Colors.white, size: 15,),)),

      if(edit != null)
      const SizedBox(width: Dimensions.paddingSizeSmall),
      if(edit != null)
      Expanded(child: CustomButton(onTap: edit, text: "edit_details".tr,
        buttonColor: Colors.transparent,
        showBorderOnly: true, borderColor: Theme.of(context).hintColor,
        textColor: Theme.of(context).textTheme.displayLarge!.color!,
        fontSize: Dimensions.fontSizeDefault,
        icon: SizedBox(height: 20, child: Image.asset(Images.edit)),)),
      if(delete == null && edit == null)
        SizedBox(width: 50)
    ],);
  }
}
