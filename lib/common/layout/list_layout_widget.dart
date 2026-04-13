import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/layout/heading_menu_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/no_data_found.dart';
import 'package:ecommerce/common/widget/paginated_list_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';


class GenericListSection<T> extends StatelessWidget {
  final bool showRouteSection;
  final String sectionTitle;
  final List<String>? pathItems;
  final String? addNewTitle;
  final VoidCallback? onAddNewTap;
  final List<String> headings;
  final Widget? subWidget;
  final bool showActionOption;
  final Widget? topWidget;

  final ScrollController scrollController;
  final bool isLoading;
  final int totalSize;
  final int offset;
  final Future<void> Function(int? offset) onPaginate;
  final List<T>? items;
  final Widget Function(T item, int index) itemBuilder;

  const GenericListSection({
    super.key,
      this.showRouteSection = true,
    required this.sectionTitle,
     this.pathItems,
     this.addNewTitle,
     this.onAddNewTap,
    required this.headings,
    required this.scrollController,
    required this.isLoading,
    required this.totalSize,
    required this.offset,
    required this.onPaginate,
    required this.items,
    required this.itemBuilder,
    this.subWidget,
     this.showActionOption = true,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return Column(children: [

      if(showRouteSection)
        SectionHeaderWithPath(
          sectionTitle: sectionTitle,
          pathItems: pathItems,
          addNewTitle: addNewTitle,
          subWidget: subWidget,
          onAddNewTap: onAddNewTap),

      if(topWidget != null)
        topWidget?? const SizedBox(),

        Padding(padding: EdgeInsets.symmetric(horizontal: isDesktop?
        Dimensions.paddingSizeDefault : Dimensions.paddingSizeExtraSmall),
          child: CustomContainer(showShadow: false,
            color: isDesktop? Theme.of(context).cardColor : Colors.transparent,
            child: Column(children: [
              if(isDesktop && headings.isNotEmpty)
                HeadingMenu(headings: headings, showActionOption: showActionOption,),

                if (isLoading)
                  Padding(padding: ThemeShadow.getPadding(),
                      child:  Center(child: CircularProgressIndicator(
                          color : systemPrimaryColor())))

                else if (items == null || items!.isEmpty)
                  Padding(padding: ThemeShadow.getPadding(),
                      child: const Center(child: NoDataFound()))

                else
                  PaginatedListWidget(
                    scrollController: scrollController,
                    onPaginate: onPaginate,
                    totalSize: totalSize,
                    offset: offset,
                    itemView: ListView.separated(
                      itemCount: items?.length ?? 0,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = items![index];
                        return itemBuilder(item, index);
                      }, separatorBuilder: (BuildContext context, int index) {
                        return ResponsiveHelper.isDesktop(context) ?
                        const CustomDivider() : const SizedBox(height: Dimensions.paddingSizeSmall);
                    },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}