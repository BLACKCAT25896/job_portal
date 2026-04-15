import 'package:ecommerce/feature/companySize/controller/company_size_controller.dart';
import 'package:ecommerce/feature/companySize/domain/models/company_size_model.dart';
import 'package:ecommerce/feature/companySize/presentation/widgets/company_size_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/dropdown_with_search_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectCompanySizeWidget extends StatefulWidget {
  const SelectCompanySizeWidget({super.key});

  @override
  State<SelectCompanySizeWidget> createState() => _SelectCompanySizeWidgetState();
}

class _SelectCompanySizeWidgetState extends State<SelectCompanySizeWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "company_size", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<CompanySizeController>(initState: (_) {
        if (Get.find<CompanySizeController>().companySizeModel == null) {
          Get.find<CompanySizeController>().getCompanySizeList(1);
        }
      },
        builder: (companySizeController) {
          return DropdownSearch<CompanySizeItem>(
            selectedItem: companySizeController.selectedCompanySizeItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              companySizeController.getCompanySizeList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: CompanySizeListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
