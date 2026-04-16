import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/job_stage/controller/job_stage_controller.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_model.dart';
import 'package:mighty_job/feature/job_stage/presentation/widgets/add_new_job_stage_widget.dart';
import 'package:mighty_job/feature/job_stage/presentation/widgets/job_stage_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobStageListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const JobStageListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<JobStageListWidget> createState() => _JobStageListWidgetState();
}

class _JobStageListWidgetState extends State<JobStageListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobStageController>(initState: (_) {
        Get.find<JobStageController>().getJobStageList(1);
      },
      builder: (controller) {
        final stageModel = controller.stageModel;
        final data = stageModel?.data;

        return GenericListSection<JobStageItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<JobStageController>().getJobStageList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "stage".tr,
          pathItems: ["stage".tr],
          addNewTitle: "add_new_stage".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "stage".tr,
                child: AddNewJobStageWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: stageModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getJobStageList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<JobStageController>().selectJobStage(item);
                Get.back(result: item);
              }
            }, child: JobStageItemWidget(index: index, stageItem: item));
          },
        );
      },
    );
  }
}
