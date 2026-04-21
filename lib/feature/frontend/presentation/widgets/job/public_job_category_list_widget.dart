import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/no_data_found.dart';
import 'package:mighty_job/common/widget/paginated_list_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/category_or_industry_selection_widget.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PublicJobCategoryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PublicJobCategoryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PublicJobCategoryListWidget> createState() => _PublicJobCategoryListWidgetState();
}

class _PublicJobCategoryListWidgetState extends State<PublicJobCategoryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(child: CustomContainer(width: Dimensions.webMaxWidth,
        showShadow: false,borderRadius: 5,
        child: GetBuilder<LandingPageController>(initState: (_) {
            Get.find<LandingPageController>().getLandingJobCategoryList(1);
          },
          builder: (controller) {
            final listingModel = controller.publicJobCategoryModel;
            final data = listingModel?.data;

            return data != null? (data.data != null && data.data!.isNotEmpty)?
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(!widget.fromFilter)
              CategoryOrIndustrySelectionWidget(),
                PaginatedListWidget(landing: true,
                  offset: data.currentPage??1,
                  scrollController: widget.scrollController,
                  totalSize: data.total,
                  onPaginate: (int? offset) async => await controller.getLandingJobCategoryList(offset??1),

                  itemView : MasonryGridView.builder(
                    itemCount: data.data?.length ?? 0,
                      shrinkWrap: true,
                      mainAxisSpacing: Dimensions.paddingSizeSmall,
                      crossAxisSpacing: Dimensions.paddingSizeSmall,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
                      itemBuilder: (_, index){
                        final item = data.data?[index];
                        return CustomContainer(onTap: (){
                          Get.toNamed(RouteHelper.getCategoryWiseJobRoute(slug: '', type: 'category'));
                        },
                            borderRadius: 5, showShadow: false,
                            child: Row(spacing: Dimensions.paddingSizeExtraSmall,
                              children: [
                                Icon(Icons.arrow_forward_ios_rounded, size: 12,
                                  color: Theme.of(context).hintColor,),
                                Expanded(child: Text(item?.name??'', style: textRegular)),
                              ],
                            ));
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
