import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_title.dart';
import 'package:job/common/widget/dropdown_with_search_widget.dart';
import 'package:job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:job/feature/inquiry/presentation/widgets/inquiry_list_widget.dart';
import 'package:job/util/dimensions.dart';

class SelectInquiryWidget extends StatefulWidget {
  const SelectInquiryWidget({super.key});

  @override
  State<SelectInquiryWidget> createState() => _SelectInquiryWidgetState();
}

class _SelectInquiryWidgetState extends State<SelectInquiryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "inquiry", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<InquiryController>(initState: (_) {
        if (Get.find<InquiryController>().inquiryModel == null) {
          Get.find<InquiryController>().getInquiryList(1);
        }
      },
        builder: (inquiryController) {
          return DropdownSearch<InquiryItem>(
            selectedItem: inquiryController.selectedInquiryItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              inquiryController.getInquiryList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: InquiryListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
