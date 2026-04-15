import 'package:mighty_job/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:mighty_job/feature/ownership_type/presentation/widgets/ownership_type_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectOwnershipTypeWidget extends StatefulWidget {
  const SelectOwnershipTypeWidget({super.key});

  @override
  State<SelectOwnershipTypeWidget> createState() => _SelectOwnershipTypeWidgetState();
}

class _SelectOwnershipTypeWidgetState extends State<SelectOwnershipTypeWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "company_size", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<OwnershipTypeController>(initState: (_) {
        if (Get.find<OwnershipTypeController>().ownershipTypeModel == null) {
          Get.find<OwnershipTypeController>().getOwnershipTypeList(1);
        }
      },
        builder: (ownershipTypeController) {
          return DropdownSearch<OwnershipTypeItem>(
            selectedItem: ownershipTypeController.selectedOwnershipTypeItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              ownershipTypeController.getOwnershipTypeList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: OwnershipTypeListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
