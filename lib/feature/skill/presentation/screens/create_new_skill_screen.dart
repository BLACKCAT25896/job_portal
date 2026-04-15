
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/add_new_skill_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewSkillScreen extends StatefulWidget {
  final SkillItem? skillItem;
  const CreateNewSkillScreen({super.key, this.skillItem});

  @override
  State<CreateNewSkillScreen> createState() => _CreateNewSkillScreenState();
}

class _CreateNewSkillScreenState extends State<CreateNewSkillScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "skill".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "skill".tr,
              pathItems: ["add_new_skill".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewSkillWidget(skillItem: widget.skillItem),
            ),
          ],
        ))
      ],),
    );
  }
}
