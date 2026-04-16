import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:mighty_job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:mighty_job/feature/inquiry/presentation/widgets/add_new_inquiry_widget.dart';
import 'package:mighty_job/feature/inquiry/presentation/widgets/inquiry_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const InquiryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<InquiryListWidget> createState() => _InquiryListWidgetState();
}

class _InquiryListWidgetState extends State<InquiryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquiryController>(initState: (_) {
        Get.find<InquiryController>().getInquiryList(1);
      },
      builder: (controller) {
        final inquiryModel = controller.inquiryModel;
        final data = inquiryModel?.data;

        return GenericListSection<InquiryItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<InquiryController>().getInquiryList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "inquiry".tr,
          pathItems: ["inquiry".tr],
          addNewTitle: "add_new_inquiry".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "inquiry".tr,
                child: AddNewInquiryWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: inquiryModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getInquiryList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<InquiryController>().selectInquiry(item);
                Get.back(result: item);
              }
            }, child: InquiryItemWidget(index: index, inquiryItem: item));
          },
        );
      },
    );
  }
}
