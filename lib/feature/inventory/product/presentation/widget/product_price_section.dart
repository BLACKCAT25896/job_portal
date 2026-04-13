import 'package:ecommerce/enum/action_type.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/search_product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/search_product_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class ProductPriceSection extends StatefulWidget {
  final Products? product;
  final int index;
  final ProductActionType actionType;
  const ProductPriceSection({super.key, required this.product,
    required this.index, required this.actionType});

  @override
  State<ProductPriceSection> createState() => _ProductPriceSectionState();
}

class _ProductPriceSectionState extends State<ProductPriceSection> {


  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.product?.price?.toString()??"1");
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductController>(builder: (searchProductController) {
      return TextField(controller: _controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        onChanged: (value) {
        if (value.isNotEmpty) {
          int cursorPosition = _controller.selection.baseOffset;
          setState(() {
            searchProductController.changePrice(widget.index, value,);
          });
          _controller.selection = TextSelection.fromPosition(TextPosition(
              offset: cursorPosition));
          _focusNode.requestFocus();
        }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(isDense: true,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(width: 1, color: Theme.of(context).hintColor.withValues(alpha:.5)),),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(width: 1,
                  color: systemPrimaryColor().withValues(alpha:1)),),
            contentPadding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.isDesktop(context)? 10 : 7, horizontal: 0)

          ),
        );
      }
    );
  }
}