import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CustomSelectWidget<T, C extends GetxController> extends StatefulWidget {
  final String title;
  final T? selectedItem;
  final String Function(T item) itemLabel;
  final TextEditingController searchController;
  final Future<void> Function(String search) onSearch;
  final VoidCallback onInit;
  final Widget Function(ScrollController scrollController) listBuilder;
  final C controller;

  const CustomSelectWidget({
    super.key,
    required this.title,
    required this.selectedItem,
    required this.itemLabel,
    required this.searchController,
    required this.onSearch,
    required this.onInit,
    required this.listBuilder,
    required this.controller,
  });

  @override
  State<CustomSelectWidget<T, C>> createState() => _CustomSelectWidgetState<T, C>();
}

class _CustomSelectWidgetState<T, C extends GetxController> extends State<CustomSelectWidget<T, C>> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: Dimensions.paddingSizeSmall),

      CustomTitle(title: widget.title, leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<C>(init: widget.controller,
        initState: (_) => widget.onInit(),
        builder: (_) {
        return DropdownSearch<T>(
          selectedItem: widget.selectedItem,
          itemLabel: widget.itemLabel,
          searchController: widget.searchController,
              onSearch: (val) => widget.onSearch(val.trim()),
              listWidgetBuilder: () => SingleChildScrollView(
                child: widget.listBuilder(scrollController),
              ),
            );
          },
        ),
      ],
    );
  }
}