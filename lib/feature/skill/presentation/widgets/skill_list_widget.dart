import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/skill/controller/skill_controller.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/add_new_skill_widget.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/skill_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const SkillListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<SkillListWidget> createState() => _SkillListWidgetState();
}

class _SkillListWidgetState extends State<SkillListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillController>(initState: (_) {
        Get.find<SkillController>().getSkillList(1);
      },
      builder: (controller) {
        final skillModel = controller.skillModel;
        final data = skillModel?.data;

        return GenericListSection<SkillItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<SkillController>().getSkillList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "skill".tr,
          pathItems: ["skill".tr],
          addNewTitle: "add_new_skill".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "skill".tr,
                child: AddNewSkillWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: skillModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getSkillList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<SkillController>().selectSkill(item);
                Get.back(result: item);
              }
            }, child: SkillItemWidget(index: index, skillItem: item));
          },
        );
      },
    );
  }
}
