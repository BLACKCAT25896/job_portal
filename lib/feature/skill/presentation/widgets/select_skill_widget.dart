import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/skill/controller/skill_controller.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/skill_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectSkillWidget extends StatefulWidget {
  const SelectSkillWidget({super.key});

  @override
  State<SelectSkillWidget> createState() => _SelectSkillWidgetState();
}

class _SelectSkillWidgetState extends State<SelectSkillWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "skill", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<SkillController>(initState: (_) {
        if (Get.find<SkillController>().skillModel == null) {
          Get.find<SkillController>().getSkillList(1);
        }
      },
        builder: (skillController) {
          return DropdownSearch<SkillItem>(
            selectedItem: skillController.selectedSkillItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              skillController.getSkillList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: SkillListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
