import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:get/get.dart';

class PaginatedListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int? offset) onPaginate;
  final int? totalSize;
  final int? offset;
  final Widget itemView;
  final bool enabledPagination;
  final bool reverse;
  final int? limit;
  final bool? landing;

  const PaginatedListWidget({
    super.key,
    required this.scrollController,
    required this.onPaginate,
    required this.totalSize,
    required this.offset,
    required this.itemView,
    this.enabledPagination = true,
    this.reverse = false,
    this.limit,
    this.landing = false,
  });

  @override
  State<PaginatedListWidget> createState() => _PaginatedListWidgetState();
}

class _PaginatedListWidgetState extends State<PaginatedListWidget> {
  int? _offset;
  late List<int?> _offsetList;
  bool _isLoading = false;

  late bool isDesktop;
  late VoidCallback _scrollListener;

  @override
  void initState() {
    super.initState();

    _offset = 1;
    _offsetList = [1];

    _scrollListener = () {
      if (!mounted) return;

      if (widget.scrollController.position.pixels >=
          widget.scrollController.position.maxScrollExtent - 100 &&
          widget.totalSize != null &&
          !_isLoading &&
          widget.enabledPagination &&
          !isDesktop) {
        _paginate();
      }
    };

    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDesktop = ResponsiveHelper.isDesktop(context);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _paginate({int? page}) async {
    int pageSize = (widget.totalSize! / (widget.limit ?? 10)).ceil();
    int targetPage = page ?? (_offset! + 1);

    if (targetPage <= pageSize) {
      setState(() {
        _offset = targetPage;
        if (!_offsetList.contains(targetPage)) {
          _offsetList.add(targetPage);
        }
        _isLoading = true;
      });

      await widget.onPaginate(_offset);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildDesktopPagination(BuildContext context) {
    if (widget.totalSize == null) return const SizedBox.shrink();

    int pageSize = (widget.totalSize! / (widget.limit ?? 10)).ceil();

    if (pageSize <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:
          _offset! > 1 ? () => _paginate(page: _offset! - 1) : null,
        ),

        Wrap(
          children: List.generate(pageSize, (index) {
            int page = index + 1;

            if (page == 1 ||
                page == pageSize ||
                (page >= _offset! - 1 && page <= _offset! + 1)) {
              return InkWell(
                onTap: () => _paginate(page: page),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: _offset == page
                        ? systemPrimaryColor()
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "$page",
                    style: textRegular.copyWith(
                      color:
                      _offset == page ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            } else if (page == 2 && _offset! > 3) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text("..."),
              );
            } else if (page == pageSize - 1 &&
                _offset! < pageSize - 2) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text("..."),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ),

        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed:
          _offset! < pageSize ? () => _paginate(page: _offset! + 1) : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.offset != null) {
      _offset = widget.offset;
      _offsetList = [];
      for (int i = 1; i <= widget.offset!; i++) {
        _offsetList.add(i);
      }
    }

    return Column(
      children: [
        widget.reverse ? const SizedBox() : widget.itemView,

        if (widget.landing == true)
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: _isLoading
                ? const CircularProgressIndicator()
                : (_offset! * (widget.limit ?? 10) <
                (widget.totalSize ?? 0))
                ? CustomContainer(
              onTap: () => _paginate(),
              child: Text(
                "view_more".tr,
                style: textRegular,
              ),
            )
                : const SizedBox(),
          )
        else if (ResponsiveHelper.isDesktop(context) &&
            widget.totalSize != null)
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: _buildDesktopPagination(context),
          )
        else if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: CircularProgressIndicator(),
            ),

        widget.reverse ? widget.itemView : const SizedBox(),
      ],
    );
  }
}