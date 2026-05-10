import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/layout/list_layout_widget.dart';
import 'package:job/feature/package_plan/controller/package_controller.dart';
import 'package:job/feature/package_plan/domain/models/package_model.dart';
import 'package:job/feature/package_plan/presentation/screens/create_new_package_screen.dart';
import 'package:job/feature/package_plan/presentation/widgets/package_item_widget.dart';

class PackageListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PackageListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(
      initState: (val) => Get.find<PackageController>().getPackageList(1),
      builder: (packageController) {
        final packageModel = packageController.packageModel;
        final packageData = packageModel?.data;

        return GenericListSection<PackageItem>(
          sectionTitle: "package_list".tr,
          addNewTitle: "add_new_package".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "package".tr,
              child: const CreateNewPackageScreen())),
          headings: const ["name", "description", "price", "duration", ],
          scrollController: scrollController,
          isLoading: packageModel == null,
          totalSize: packageData?.meta?.total ?? 0,
          offset: packageData?.meta?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await packageController.getPackageList(offset ?? 1),
          items: packageData?.data ?? [],
          itemBuilder: (item, index) => PackageItemWidget(index: index, packageItem: item),
        );
      },
    );
  }
}
