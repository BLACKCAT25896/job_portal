import 'package:ecommerce/feature/industries/controller/industry_controller.dart';
import 'package:ecommerce/feature/industries/domain/models/industry_model.dart';
import 'package:ecommerce/feature/industries/presentation/widgets/industry_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/dropdown_with_search_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectIndustryWidget extends StatefulWidget {
  const SelectIndustryWidget({super.key});

  @override
  State<SelectIndustryWidget> createState() => _SelectIndustryWidgetState();
}

class _SelectIndustryWidgetState extends State<SelectIndustryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "industry", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<IndustryController>(initState: (_) {
        if (Get.find<IndustryController>().industryModel == null) {
          Get.find<IndustryController>().getIndustryList(1);
        }
      },
        builder: (industryController) {
          return DropdownSearch<IndustryItem>(
            selectedItem: industryController.selectedIndustryItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              industryController.getIndustryList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: IndustryListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
