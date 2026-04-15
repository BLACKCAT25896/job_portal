import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/company/controller/company_controller.dart';
import 'package:ecommerce/feature/company/domain/models/company_model.dart';
import 'package:ecommerce/feature/company/presentation/widgets/add_new_company_widget.dart';
import 'package:ecommerce/feature/company/presentation/widgets/company_item.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const CompanyListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<CompanyListWidget> createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyController>(initState: (_) {
        Get.find<CompanyController>().getCompanyList(1);
      },
      builder: (controller) {
        final companyModel = controller.companyModel;
        final data = companyModel?.data;

        return GenericListSection<CompanyItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<CompanyController>().getCompanyList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "company".tr,
          pathItems: ["company".tr],
          addNewTitle: "add_new_company".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "company".tr,
                child: AddNewCompanyWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: companyModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getCompanyList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<CompanyController>().selectCompany(item);
                Get.back(result: item);
              }
            }, child: CompanyItemWidget(index: index, companyItem: item));
          },
        );
      },
    );
  }
}
