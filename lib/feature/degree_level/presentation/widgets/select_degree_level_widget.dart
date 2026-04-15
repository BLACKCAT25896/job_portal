import 'package:ecommerce/feature/career_level/controller/career_level_controller.dart';
import 'package:ecommerce/feature/career_level/domain/models/career_level_model.dart';
import 'package:ecommerce/feature/career_level/presentation/widgets/career_level_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/dropdown_with_search_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectCareerLevelWidget extends StatefulWidget {
  const SelectCareerLevelWidget({super.key});

  @override
  State<SelectCareerLevelWidget> createState() => _SelectCareerLevelWidgetState();
}

class _SelectCareerLevelWidgetState extends State<SelectCareerLevelWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "career_level", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<CareerLevelController>(initState: (_) {
        if (Get.find<CareerLevelController>().careerLevelModel == null) {
          Get.find<CareerLevelController>().getCareerLevelList(1);
        }
      },
        builder: (careerLevelController) {
          return DropdownSearch<CareerLevelItem>(
            selectedItem: careerLevelController.selectedCareerLevelItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              careerLevelController.getCareerLevelList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: CareerLevelListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
