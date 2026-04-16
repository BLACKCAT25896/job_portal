import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/favorite_company/controller/favorite_company_controller.dart';
import 'package:mighty_job/feature/favorite_company/domain/models/favorite_company_model.dart';
import 'package:mighty_job/feature/favorite_company/presentation/widgets/favorite_company_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteCompanyListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const FavoriteCompanyListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<FavoriteCompanyListWidget> createState() => _FavoriteCompanyListWidgetState();
}

class _FavoriteCompanyListWidgetState extends State<FavoriteCompanyListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteCompanyController>(initState: (_) {
        Get.find<FavoriteCompanyController>().getFavoriteCompanyList(1);
      },
      builder: (controller) {
        final favoriteCompanyModel = controller.favoriteCompanyModel;
        final data = favoriteCompanyModel?.data;

        return GenericListSection<FavoriteCompanyItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<FavoriteCompanyController>().getFavoriteCompanyList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "favorite_company".tr,
          pathItems: ["favorite_company".tr],


          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: favoriteCompanyModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getFavoriteCompanyList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<FavoriteCompanyController>().selectFavoriteCompany(item);
                Get.back(result: item);
              }
            }, child: FavoriteCompanyItemWidget(index: index, favoriteCompanyItem: item));
          },
        );
      },
    );
  }
}
