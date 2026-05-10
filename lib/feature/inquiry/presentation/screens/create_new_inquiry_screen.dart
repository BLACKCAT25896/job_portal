
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/section_header_with_path_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:job/feature/inquiry/presentation/widgets/add_new_inquiry_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewInquiryScreen extends StatefulWidget {
  final InquiryItem? inquiryItem;
  const CreateNewInquiryScreen({super.key, this.inquiryItem});

  @override
  State<CreateNewInquiryScreen> createState() => _CreateNewInquiryScreenState();
}

class _CreateNewInquiryScreenState extends State<CreateNewInquiryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "inquiry".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "inquiry".tr,
              pathItems: ["add_new_inquiry".tr]),
            Padding(padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewInquiryWidget(inquiryItem: widget.inquiryItem),
            ),
          ],
        ))
      ],),
    );
  }
}
