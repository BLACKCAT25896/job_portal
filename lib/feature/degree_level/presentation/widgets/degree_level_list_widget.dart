import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/degree_level/controller/degree_level_controller.dart';
import 'package:mighty_job/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:mighty_job/feature/degree_level/presentation/widgets/add_new_degree_level_widget.dart';
import 'package:mighty_job/feature/degree_level/presentation/widgets/degree_level_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DegreeLevelListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const DegreeLevelListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<DegreeLevelListWidget> createState() => _DegreeLevelListWidgetState();
}

class _DegreeLevelListWidgetState extends State<DegreeLevelListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DegreeLevelController>(initState: (_) {
        Get.find<DegreeLevelController>().getDegreeLevelList(1);
      },
      builder: (controller) {
        final degreeLevelModel = controller.degreeLevelModel;
        final data = degreeLevelModel?.data;

        return GenericListSection<DegreeLevelItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<DegreeLevelController>().getDegreeLevelList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "degree_level".tr,
          pathItems: ["degree_level".tr],
          addNewTitle: "add_new_degree_level".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "degree_level".tr,
                child: AddNewDegreeLevelWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: degreeLevelModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getDegreeLevelList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<DegreeLevelController>().selectDegreeLevel(item);
                Get.back(result: item);
              }
            }, child: DegreeLevelItemWidget(index: index, degreeLevelItem: item));
          },
        );
      },
    );
  }
}
