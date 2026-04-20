import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/public_industry_list_widget.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';

class SelectPublicIndustryWidget extends StatefulWidget {
  const SelectPublicIndustryWidget({super.key});

  @override
  State<SelectPublicIndustryWidget> createState() => _SelectPublicIndustryWidgetState();
}

class _SelectPublicIndustryWidgetState extends State<SelectPublicIndustryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(initState: (_) {
      if (Get.find<LandingPageController>().publicIndustryModel == null) {
        Get.find<LandingPageController>().getLandingIndustryList(1);
      }
    },
      builder: (industryController) {
        return DropdownSearch<IndustryItem>(
          hintText: 'select_industry'.tr,
          selectedItem: industryController.selectedIndustryItem,
          itemLabel: (item) => item.name ?? "",
          searchController: searchController,
          onSearch: (val) {
            industryController.getLandingIndustryList(1, search: val.trim());
          },
          listWidgetBuilder: () => SingleChildScrollView(
              child: PublicIndustryListWidget(fromFilter: true,
                  scrollController: scrollController)),
        );
      },
    );
  }
}
