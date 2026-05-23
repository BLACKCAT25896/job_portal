import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/styles.dart';

class CandidatePaginatedSectionWidget extends StatelessWidget {
  final String sectionKey;
  final String title;
  final String addButtonTitle;
  final ScrollController scrollController;
  final int totalSize;
  final int offset;

  final Future<void> Function(int offset) onPaginate;
  final VoidCallback onAdd;

  final Widget child;

  const CandidatePaginatedSectionWidget({
    super.key,
    required this.sectionKey,
    required this.title,
    required this.addButtonTitle,
    required this.scrollController,
    required this.totalSize,
    required this.offset,
    required this.onPaginate,
    required this.onAdd,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    final listWidget = PaginatedListWidget(
      scrollController: scrollController,
      onPaginate: (page) async {
        await onPaginate(page ?? 1);
      },
      totalSize: totalSize,
      offset: offset,
      itemView: child,
    );

    if (!isDesktop) {
      return listWidget;
    }

    return GetBuilder<CandidatePanelController>(
      builder: (controller) {
        return CustomExpandCollapse(
          trailing: CustomAddNewButtonWidget(title: addButtonTitle, onTap: onAdd),
          initiallyExpanded: true,
          isExpanded: controller.isExpanded(sectionKey),
          onChanged: (_) => controller.toggleSection(sectionKey),
          header: Text(title, style: sectionHeadingTextStyle(context)),
          child: listWidget,
        );
      },
    );
  }
}