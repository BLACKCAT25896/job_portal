import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/salary_currency_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectSalaryCurrencyWidget extends StatefulWidget {
  const SelectSalaryCurrencyWidget({super.key});

  @override
  State<SelectSalaryCurrencyWidget> createState() => _SelectSalaryCurrencyWidgetState();
}

class _SelectSalaryCurrencyWidgetState extends State<SelectSalaryCurrencyWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "salary_currency", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<SalaryCurrencyController>(initState: (_) {
        if (Get.find<SalaryCurrencyController>().salaryCurrencyModel == null) {
          Get.find<SalaryCurrencyController>().getSalaryCurrencyList(1);
        }
      },
        builder: (salaryCurrencyController) {
          return DropdownSearch<SalaryCurrencyItem>(
            selectedItem: salaryCurrencyController.selectedSalaryCurrencyItem,
            itemLabel: (item) => item.currencyName ?? "",
            searchController: searchController,
            onSearch: (val) {
              salaryCurrencyController.getSalaryCurrencyList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: SalaryCurrencyListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
