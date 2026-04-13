
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class CustomDropdown extends StatefulWidget {
  final double? width;
  final bool border;
  final String title;
  final String? headingTitle;
  final List<String>? items ;
  final Function(String?)? onChanged;
  final String? selectedValue;
  final double? padding;
  const CustomDropdown({super.key, this.width, this.border = false, required this.title, this.items, this.onChanged, this.selectedValue, this.padding, this.headingTitle});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {


  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeSmall, children: [
        if(widget.headingTitle != null)
          Text(widget.headingTitle??'', style: textRegular),
        Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: .5, color: Theme.of(context).hintColor), ),
          padding: EdgeInsets.symmetric(horizontal: widget.padding?? Dimensions.paddingSizeSmall),
          child: DropdownButton2<String>(
            isExpanded: true,
            underline: const SizedBox(),
            hint: Text(widget.selectedValue?? widget.title.tr, style: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeDefault),),
            items: widget.items != null?
            widget.items?.map((String item) => DropdownMenuItem<String>(
              value: item, child: Text(item.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)))).toList():[],
            value: widget.selectedValue,
            onChanged: widget.onChanged,
            buttonStyleData: ButtonStyleData(padding: EdgeInsets.zero,
              height: 33, width: widget.width?? 100),
            menuItemStyleData: const MenuItemStyleData(height: 33),
          ),
        ),
      ],
    );
  }
}
