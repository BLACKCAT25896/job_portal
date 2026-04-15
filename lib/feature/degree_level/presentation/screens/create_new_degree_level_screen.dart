
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:mighty_job/feature/degree_level/presentation/widgets/add_new_degree_level_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewDegreeLevelScreen extends StatefulWidget {
  final DegreeLevelItem? degreeLevelItem;
  const CreateNewDegreeLevelScreen({super.key, this.degreeLevelItem});

  @override
  State<CreateNewDegreeLevelScreen> createState() => _CreateNewDegreeLevelScreenState();
}

class _CreateNewDegreeLevelScreenState extends State<CreateNewDegreeLevelScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "degree_level".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "degree_level".tr,
              pathItems: ["add_new_degree_level".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewDegreeLevelWidget(degreeLevelItem: widget.degreeLevelItem),
            ),
          ],
        ))
      ],),
    );
  }
}
