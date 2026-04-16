import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/job_application/controller/job_application_controller.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_model.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/add_new_job_application_widget.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/job_application_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobApplicationListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const JobApplicationListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<JobApplicationListWidget> createState() => _JobApplicationListWidgetState();
}

class _JobApplicationListWidgetState extends State<JobApplicationListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobApplicationController>(initState: (_) {
        Get.find<JobApplicationController>().getJobApplicationList(1);
      },
      builder: (controller) {
        final applicationModel = controller.applicationModel;
        final data = applicationModel?.data;

        return GenericListSection<JobApplicationItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<JobApplicationController>().getJobApplicationList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "application".tr,
          pathItems: ["application".tr],
          addNewTitle: "add_new_application".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "application".tr,
                child: AddNewJobApplicationWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: applicationModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getJobApplicationList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<JobApplicationController>().selectJobApplication(item);
                Get.back(result: item);
              }
            }, child: JobApplicationItemWidget(index: index, applicationItem: item));
          },
        );
      },
    );
  }
}
