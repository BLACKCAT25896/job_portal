import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/add_new_salary_currency_widget.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/salary_currency_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryCurrencyListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const SalaryCurrencyListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<SalaryCurrencyListWidget> createState() => _SalaryCurrencyListWidgetState();
}

class _SalaryCurrencyListWidgetState extends State<SalaryCurrencyListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalaryCurrencyController>(initState: (_) {
        Get.find<SalaryCurrencyController>().getSalaryCurrencyList(1);
      },
      builder: (controller) {
        final model = controller.salaryCurrencyModel;
        final data = model?.data;

        return GenericListSection<SalaryCurrencyItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<SalaryCurrencyController>().getSalaryCurrencyList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "salary_currency".tr,
          pathItems: ["salary_currency".tr],
          addNewTitle: "add_new_salary_currency".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "salary_currency".tr,
                child: AddNewSalaryCurrencyWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: model == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getSalaryCurrencyList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<SalaryCurrencyController>().selectSalaryCurrency(item);
                Get.back(result: item);
              }
            }, child: SalaryCurrencyItemWidget(index: index, salaryCurrencyItem: item));
          },
        );
      },
    );
  }
}
