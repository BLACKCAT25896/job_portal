import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SearchAndDownloadWidget extends StatelessWidget {
  final Function()? onTap;
  final Function()? download;
  const SearchAndDownloadWidget({super.key, this.onTap, this.download});

  @override
  Widget build(BuildContext context) {
    return Align(alignment : Alignment.centerRight,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Row(mainAxisSize: MainAxisSize.min, children: [

          if(download != null)
            SizedBox(child: CustomContainer(onTap: download,borderRadius: 5,
                child: Row(children: [const Icon(Icons.download), Text("pdf_report".tr, style: textRegular.copyWith())]))),

          if(onTap != null)
          Padding(padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(width: 100, child: CustomButton(onTap: onTap, text: "submit".tr))),
        ]),
      ),
    );
  }
}
