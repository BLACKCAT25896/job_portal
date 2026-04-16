import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/favorite_job/controller/favorite_job_controller.dart';
import 'package:mighty_job/feature/favorite_job/domain/models/favorite_job_model.dart';
import 'package:mighty_job/feature/favorite_job/presentation/widgets/favorite_job_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteJobListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const FavoriteJobListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<FavoriteJobListWidget> createState() => _FavoriteJobListWidgetState();
}

class _FavoriteJobListWidgetState extends State<FavoriteJobListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteJobController>(initState: (_) {
        Get.find<FavoriteJobController>().getFavoriteJobList(1);
      },
      builder: (controller) {
        final favoriteJobModel = controller.favoriteJobModel;
        final data = favoriteJobModel?.data;

        return GenericListSection<FavoriteJobItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<FavoriteJobController>().getFavoriteJobList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "favoriteJob".tr,
          pathItems: ["favoriteJob".tr],

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: favoriteJobModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getFavoriteJobList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<FavoriteJobController>().selectFavoriteJob(item);
                Get.back(result: item);
              }
            }, child: FavoriteJobItemWidget(index: index, favoriteJobItem: item));
          },
        );
      },
    );
  }
}
