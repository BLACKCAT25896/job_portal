import 'package:job/common/layout/list_layout_widget.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:job/feature/job_listing/presentation/widgets/company_job_list_item.dart';
import 'package:job/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobListingListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const CompanyJobListingListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<CompanyJobListingListWidget> createState() => _CompanyJobListingListWidgetState();
}

class _CompanyJobListingListWidgetState extends State<CompanyJobListingListWidget> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(initState: (_) {
        Get.find<JobListingController>().getCompanyJobListingList(1);
      },
      builder: (controller) {
        final listingModel = controller.listingModel;
        final data = listingModel?.data;

        return GenericListSection<JobListingItem>(
          showRouteSection: !widget.fromFilter,
          sectionTitle: "job_dashboard".tr,
          pathItems: ["talent_search".tr],
          addNewTitle: "post_new_job".tr,
          onAddNewTap: () {
          Get.toNamed(RouteHelper.getPostAJobRoute());
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
            }, child: CompanyJobListItemWidget(index: index, listingItem: item));
          },
        );
      },
    );
  }
}
