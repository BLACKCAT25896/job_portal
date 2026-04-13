
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/domain/model/policy_model.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/presentation/widgets/create_new_page_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class PageItemWidget extends StatelessWidget {
  final PagesItem? pageItem;
  final int index;
  const PageItemWidget({super.key, this.pageItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text:"${pageItem?.type?.replaceAll("_", " ").capitalize}")),
      //Expanded(child: HtmlAutoHeightPreview(htmlContent: pageItem?.description??'')),
      Expanded(child: CustomTextItemWidget(text: pageItem?.description??'')),
      EditDeleteSection(onEdit: () => _onEdit(context),
          onDelete: () => _onDelete(),isHorizontal: true)
    ]):

    CustomContainer(showShadow: false, borderRadius: 5,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeSmall, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomTextItemWidget(text: "${pageItem?.type?.replaceAll("_", " ").capitalize}"),
            CustomTextItemWidget(text: pageItem?.description??''),

          ])),

          EditDeletePopupMenu(onEdit: () => _onEdit(context),
            onDelete: () => _onDelete(),)

        ],
        ));
  }
  void _onEdit(BuildContext context) {
    Get.dialog(
      Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewPageWidget(pageItem: pageItem),
        ),
      ),
    );
  }

  void _onDelete() {
    Get.dialog(
      ConfirmationDialog(
        title: "page",
        onTap: () {
          Get.back();
          Get.find<PagesController>().deletePage(pageItem!.id!);
        },
      ),
    );
  }
}
