import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:mighty_job/feature/ownership_type/presentation/widgets/add_new_ownership_type_widget.dart';
import 'package:mighty_job/feature/ownership_type/presentation/widgets/ownership_type_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnershipTypeListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const OwnershipTypeListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<OwnershipTypeListWidget> createState() => _OwnershipTypeListWidgetState();
}

class _OwnershipTypeListWidgetState extends State<OwnershipTypeListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnershipTypeController>(initState: (_) {
        Get.find<OwnershipTypeController>().getOwnershipTypeList(1);
      },
      builder: (controller) {
        final ownershipTypeModel = controller.ownershipTypeModel;
        final data = ownershipTypeModel?.data;

        return GenericListSection<OwnershipTypeItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<OwnershipTypeController>().getOwnershipTypeList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "ownership_type".tr,
          pathItems: ["ownership_type".tr],
          addNewTitle: "add_new_ownership_type".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "ownership_type".tr,
                child: AddNewOwnershipTypeWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: ownershipTypeModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getOwnershipTypeList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<OwnershipTypeController>().selectOwnershipType(item);
                Get.back(result: item);
              }
            }, child: OwnershipTypeItemWidget(index: index, ownershipTypeItem: item));
          },
        );
      },
    );
  }
}
