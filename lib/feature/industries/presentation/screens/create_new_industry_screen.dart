
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/feature/industries/presentation/widgets/add_new_industry_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewIndustryScreen extends StatefulWidget {
  final IndustryItem? industryItem;
  const CreateNewIndustryScreen({super.key, this.industryItem});

  @override
  State<CreateNewIndustryScreen> createState() => _CreateNewIndustryScreenState();
}

class _CreateNewIndustryScreenState extends State<CreateNewIndustryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "industry".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "industry".tr,
              pathItems: ["add_new_industry".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewIndustryWidget(industryItem: widget.industryItem),
            ),
          ],
        ))
      ],),
    );
  }
}
