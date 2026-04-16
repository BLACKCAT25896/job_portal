import 'package:mighty_job/feature/company/controller/company_controller.dart';
import 'package:mighty_job/feature/company/domain/models/company_model.dart';
import 'package:mighty_job/feature/company/presentation/widgets/company_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectCompanyWidget extends StatefulWidget {
  const SelectCompanyWidget({super.key});

  @override
  State<SelectCompanyWidget> createState() => _SelectCompanyWidgetState();
}

class _SelectCompanyWidgetState extends State<SelectCompanyWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "company", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<CompanyController>(initState: (_) {
        if (Get.find<CompanyController>().companyModel == null) {
          Get.find<CompanyController>().getCompanyList(1);
        }
      },
        builder: (companyController) {
          return DropdownSearch<CompanyItem>(
            selectedItem: companyController.selectedCompanyItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              companyController.getCompanyList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: CompanyListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
