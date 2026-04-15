
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/career_level/domain/models/career_level_model.dart';
import 'package:mighty_job/feature/career_level/presentation/widgets/add_new_career_level_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewCareerLevelScreen extends StatefulWidget {
  final CareerLevelItem? careerLevelItem;
  const CreateNewCareerLevelScreen({super.key, this.careerLevelItem});

  @override
  State<CreateNewCareerLevelScreen> createState() => _CreateNewCareerLevelScreenState();
}

class _CreateNewCareerLevelScreenState extends State<CreateNewCareerLevelScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "career_level".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "career_level".tr,
              pathItems: ["add_new_career_level".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewCareerLevelWidget(careerLevelItem: widget.careerLevelItem),
            ),
          ],
        ))
      ],),
    );
  }
}
