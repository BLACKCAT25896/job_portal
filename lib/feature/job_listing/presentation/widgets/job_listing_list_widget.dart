import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/add_new_job_listing_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/job_listing_item.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobListingListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const JobListingListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<JobListingListWidget> createState() => _JobListingListWidgetState();
}

class _JobListingListWidgetState extends State<JobListingListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(initState: (_) {
        Get.find<JobListingController>().getJobListingList(1);
      },
      builder: (controller) {
        final listingModel = controller.listingModel;
        final data = listingModel?.data;

        return GenericListSection<JobListingItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<JobListingController>().getJobListingList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "listing".tr,
          pathItems: ["listing".tr],
          addNewTitle: "add_new_listing".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "listing".tr,
                child: AddNewJobListingWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: listingModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getJobListingList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<JobListingController>().selectJobListing(item);
                Get.back(result: item);
              }
            }, child: JobListingItemWidget(index: index, listingItem: item));
          },
        );
      },
    );
  }
}
