import 'package:job/common/layout/list_layout_widget.dart';
import 'package:job/feature/job_application/controller/job_application_controller.dart';
import 'package:job/feature/job_application/domain/models/job_application_model.dart';
import 'package:job/feature/job_application/presentation/widgets/job_application_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobApplicationListWidget extends StatefulWidget {
  final ScrollController scrollController;

  const JobApplicationListWidget({super.key, required this.scrollController});

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
          showRouteSection: false,
          sectionTitle: "application".tr,
          pathItems: ["application".tr],
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
            return JobApplicationItemWidget(index: index, applicationItem: item);
          },
        );
      },
    );
  }
}
