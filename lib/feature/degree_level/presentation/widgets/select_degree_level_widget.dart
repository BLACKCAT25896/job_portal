import 'package:job/feature/degree_level/controller/degree_level_controller.dart';
import 'package:job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:job/feature/degree_level/presentation/widgets/degree_level_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_title.dart';
import 'package:job/common/widget/dropdown_with_search_widget.dart';
import 'package:job/util/dimensions.dart';

class SelectDegreeLevelWidget extends StatefulWidget {
  const SelectDegreeLevelWidget({super.key});

  @override
  State<SelectDegreeLevelWidget> createState() => _SelectDegreeLevelWidgetState();
}

class _SelectDegreeLevelWidgetState extends State<SelectDegreeLevelWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "degree_level", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<DegreeLevelController>(initState: (_) {
        if (Get.find<DegreeLevelController>().degreeLevelModel == null) {
          Get.find<DegreeLevelController>().getDegreeLevelList(1);
        }
      },
        builder: (degreeLevelController) {
          return DropdownSearch<DegreeLevelItem>(
            selectedItem: degreeLevelController.selectedDegreeLevelItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              degreeLevelController.getDegreeLevelList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: DegreeLevelListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
