import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/industries/controller/industry_controller.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/feature/industries/presentation/widgets/add_new_industry_widget.dart';
import 'package:mighty_job/feature/industries/presentation/widgets/industry_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndustryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const IndustryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<IndustryListWidget> createState() => _IndustryListWidgetState();
}

class _IndustryListWidgetState extends State<IndustryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndustryController>(initState: (_) {
        Get.find<IndustryController>().getIndustryList(1);
      },
      builder: (controller) {
        final industryModel = controller.industryModel;
        final data = industryModel?.data;

        return GenericListSection<IndustryItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<IndustryController>().getIndustryList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "industry".tr,
          pathItems: ["industry".tr],
          addNewTitle: "add_new_industry".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "industry".tr,
                child: AddNewIndustryWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: industryModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getIndustryList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<IndustryController>().selectIndustry(item);
                Get.back(result: item);
              }
            }, child: IndustryItemWidget(index: index, industryItem: item));
          },
        );
      },
    );
  }
}
