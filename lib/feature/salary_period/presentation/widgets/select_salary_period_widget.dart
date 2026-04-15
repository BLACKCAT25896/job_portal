import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/salary_period_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectSalaryPeriodWidget extends StatefulWidget {
  const SelectSalaryPeriodWidget({super.key});

  @override
  State<SelectSalaryPeriodWidget> createState() => _SelectSalaryPeriodWidgetState();
}

class _SelectSalaryPeriodWidgetState extends State<SelectSalaryPeriodWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "salary_period", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<SalaryPeriodController>(initState: (_) {
        if (Get.find<SalaryPeriodController>().salaryPeriodModel == null) {
          Get.find<SalaryPeriodController>().getSalaryPeriodList(1);
        }
      },
        builder: (salaryPeriodController) {
          return DropdownSearch<SalaryPeriodItem>(
            selectedItem: salaryPeriodController.selectedSalaryPeriodItem,
            itemLabel: (item) => item.period ?? "",
            searchController: searchController,
            onSearch: (val) {
              salaryPeriodController.getSalaryPeriodList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: SalaryPeriodListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
