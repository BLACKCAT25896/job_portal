import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/add_new_salary_period_widget.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/salary_period_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryPeriodListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const SalaryPeriodListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<SalaryPeriodListWidget> createState() => _SalaryPeriodListWidgetState();
}

class _SalaryPeriodListWidgetState extends State<SalaryPeriodListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryPeriodController>(initState: (_) {
        Get.find<SalaryPeriodController>().getSalaryPeriodList(1);
      },
      builder: (controller) {
        final model = controller.salaryPeriodModel;
        final data = model?.data;

        return GenericListSection<SalaryPeriodItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<SalaryPeriodController>().getSalaryPeriodList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "salary_period".tr,
          pathItems: ["salary_period".tr],
          addNewTitle: "add_new_salary_period".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "salary_period".tr,
                child: AddNewSalaryPeriodWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: model == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getSalaryPeriodList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<SalaryPeriodController>().selectSalaryPeriod(item);
                Get.back(result: item);
              }
            }, child: SalaryPeriodItemWidget(index: index, salaryPeriodItem: item));
          },
        );
      },
    );
  }
}
