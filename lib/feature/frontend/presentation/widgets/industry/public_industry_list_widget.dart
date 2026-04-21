import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/no_data_found.dart';
import 'package:mighty_job/common/widget/paginated_list_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/category_or_industry_selection_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/public_industry_iten_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class PublicIndustryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PublicIndustryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PublicIndustryListWidget> createState() => _PublicIndustryListWidgetState();
}

class _PublicIndustryListWidgetState extends State<PublicIndustryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(child: CustomContainer(width: Dimensions.webMaxWidth,
      showShadow: false,borderRadius: 5,
      child: GetBuilder<LandingPageController>(initState: (_) {
        Get.find<LandingPageController>().getLandingIndustryList(1);
      },
        builder: (controller) {
          final listingModel = controller.publicIndustryModel;
          final data = listingModel?.data;

          return data != null? (data.data != null && data.data!.isNotEmpty)?
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if(!widget.fromFilter)
            CategoryOrIndustrySelectionWidget(),
            PaginatedListWidget(landing: true,limit: 50,
              offset: data.currentPage??1,
              scrollController: widget.scrollController,
              totalSize: data.total,
              onPaginate: (int? offset) async => await controller.getLandingIndustryList(offset??1),

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
                    return PublicIndustryItemWidget(index: index, item: item);
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
