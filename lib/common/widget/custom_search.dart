import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';


class CustomSearch extends StatefulWidget {
  final String? hintText;
  final TextEditingController searchController;
  final VoidCallback? onSearch;
  final Function(String value)? onChange;
  final VoidCallback? reset;
  final double? horizontalPadding;

  const CustomSearch({
    super.key,
    required this.hintText,
    required this.searchController,
    this.onSearch,
    this.onChange,
    this.reset,
    this.horizontalPadding,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).hintColor, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeExtraSmall,
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: TextFormField(
                controller: widget.searchController,
                textInputAction: TextInputAction.search,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (val) {
                  setState(() {});
                  if (widget.onChange != null) {
                    widget.onChange!(val);
                  }
                },
                onFieldSubmitted: (val) {
                  widget.onSearch?.call();
                },
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall, vertical: 5),
                  hintStyle: textRegular.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: Dimensions.fontSizeDefault),
                  border: InputBorder.none,
                  prefixIconConstraints:
                  const BoxConstraints(maxHeight: 30, maxWidth: 50),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 20,
                      child: Image.asset(
                        Images.search,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(maxHeight: 25, maxWidth: 35),
                  suffixIcon: widget.searchController.text.isNotEmpty
                      ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.searchController.clear();
                      });
                      widget.reset?.call();
                      widget.onChange?.call("");
                    },
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                      : const SizedBox(),
                ),
              ),
            ),
          ),

          /// Search button
          InkWell(
            onTap: widget.onSearch,
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: systemPrimaryColor(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                spacing: Dimensions.paddingSizeSmall,
                children: [
                  SizedBox(
                    height: 16,
                    child: Image.asset(Images.search, color: Colors.white),
                  ),
                  Text(
                    "search".tr,
                    style: textRegular.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

