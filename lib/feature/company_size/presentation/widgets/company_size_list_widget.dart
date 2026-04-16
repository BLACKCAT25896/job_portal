import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/company_size/controller/company_size_controller.dart';
import 'package:mighty_job/feature/company_size/domain/models/company_size_model.dart';
import 'package:mighty_job/feature/company_size/presentation/widgets/add_new_company_size_widget.dart';
import 'package:mighty_job/feature/company_size/presentation/widgets/company_size_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySizeListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const CompanySizeListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<CompanySizeListWidget> createState() => _CompanySizeListWidgetState();
}

class _CompanySizeListWidgetState extends State<CompanySizeListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanySizeController>(initState: (_) {
        Get.find<CompanySizeController>().getCompanySizeList(1);
      },
      builder: (controller) {
        final companySizeModel = controller.companySizeModel;
        final data = companySizeModel?.data;

        return GenericListSection<CompanySizeItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<CompanySizeController>().getCompanySizeList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "company_size".tr,
          pathItems: ["company_size".tr],
          addNewTitle: "add_new_companySize".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "company_size".tr,
                child: AddNewCompanySizeWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: companySizeModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getCompanySizeList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<CompanySizeController>().selectCompanySize(item);
                Get.back(result: item);
              }
            }, child: CompanySizeItemWidget(index: index, companySizeItem: item));
          },
        );
      },
    );
  }
}
