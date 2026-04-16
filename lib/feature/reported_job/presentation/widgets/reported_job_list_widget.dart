import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/add_new_reported_job_widget.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/reported_job_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportedJobListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const ReportedJobListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<ReportedJobListWidget> createState() => _ReportedJobListWidgetState();
}

class _ReportedJobListWidgetState extends State<ReportedJobListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportedJobController>(initState: (_) {
        Get.find<ReportedJobController>().getReportedJobList(1);
      },
      builder: (controller) {
        final reportedJobModel = controller.reportedJobModel;
        final data = reportedJobModel?.data;

        return GenericListSection<ReportedJobItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<ReportedJobController>().getReportedJobList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "reportedJob".tr,
          pathItems: ["reportedJob".tr],
          addNewTitle: "add_new_reportedJob".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "reportedJob".tr,
                child: AddNewReportedJobWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: reportedJobModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getReportedJobList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<ReportedJobController>().selectReportedJob(item);
                Get.back(result: item);
              }
            }, child: ReportedJobItemWidget(index: index, reportedJobItem: item));
          },
        );
      },
    );
  }
}
