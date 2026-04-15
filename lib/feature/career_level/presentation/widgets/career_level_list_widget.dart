import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/career_level/controller/career_level_controller.dart';
import 'package:ecommerce/feature/career_level/domain/models/career_level_model.dart';
import 'package:ecommerce/feature/career_level/presentation/widgets/add_new_career_level_widget.dart';
import 'package:ecommerce/feature/career_level/presentation/widgets/career_level_item.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerLevelListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const CareerLevelListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<CareerLevelListWidget> createState() => _CareerLevelListWidgetState();
}

class _CareerLevelListWidgetState extends State<CareerLevelListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CareerLevelController>(initState: (_) {
        Get.find<CareerLevelController>().getCareerLevelList(1);
      },
      builder: (controller) {
        final careerLevelModel = controller.careerLevelModel;
        final data = careerLevelModel?.data;

        return GenericListSection<CareerLevelItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<CareerLevelController>().getCareerLevelList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "career_level".tr,
          pathItems: ["career_level".tr],
          addNewTitle: "add_new_career_level".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "career_level".tr,
                child: AddNewCareerLevelWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: careerLevelModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getCareerLevelList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<CareerLevelController>().selectCareerLevel(item);
                Get.back(result: item);
              }
            }, child: CareerLevelItemWidget(index: index, careerLevelItem: item));
          },
        );
      },
    );
  }
}
