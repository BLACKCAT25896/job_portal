import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/no_data_found.dart';
import 'package:mighty_job/common/widget/paginated_list_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_listing_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PublicJobListingListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PublicJobListingListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PublicJobListingListWidget> createState() => _PublicJobListingListWidgetState();
}

class _PublicJobListingListWidgetState extends State<PublicJobListingListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(child: CustomContainer(width: Dimensions.webMaxWidth,
        showShadow: false,borderRadius: 5,
        child: GetBuilder<LandingPageController>(initState: (_) {
          if(Get.find<LandingPageController>().publicJobListingModel == null) {
            Get.find<LandingPageController>().getLandingJobListingList(1);
          }
          },
          builder: (controller) {
            final listingModel = controller.publicJobListingModel;
            final data = listingModel?.data;

            return data != null? (data.data != null && data.data!.isNotEmpty)?
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeSmall, children: [

                if(!widget.fromFilter)
                Text("hot_jobs".tr, style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),

                PaginatedListWidget(landing: true,limit: 50,
                  offset: data.currentPage??1,
                  scrollController: widget.scrollController,
                  totalSize: data.total,
                  onPaginate: (int? offset) async => await controller.getLandingJobListingList(offset??1),

                  itemView : MasonryGridView.builder(
                    itemCount: data.data?.length ?? 0,
                      shrinkWrap: true,
                      mainAxisSpacing: Dimensions.paddingSizeDefault,
                      crossAxisSpacing: Dimensions.paddingSizeDefault,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: widget.fromFilter? 500 : 300),
                      itemBuilder: (_, index){
                        final item = data.data?[index];
                        return PublicJoListingItemWidget(item: item, fromFilter: widget.fromFilter);
                       }),
                ),
              ],
            ): NoDataFound(): const Center(child: CircularProgressIndicator());

          },
        ),
      ),
    );
  }
}
