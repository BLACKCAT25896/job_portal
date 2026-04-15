import 'package:mighty_job/common/model/popup_menu_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopupMenu extends StatefulWidget {
  final List<PopupMenuModel> menuItems;
  final void Function(PopupMenuModel)? onSelected;
  final Widget? child;
  final bool openOnHover;

  const CustomPopupMenu({super.key, required this.menuItems,
    this.onSelected, this.child, this.openOnHover = true});

  @override
  State<CustomPopupMenu> createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  final GlobalKey _key = GlobalKey();

  void _openMenu() async {
    final RenderBox renderBox =
    _key.currentContext!.findRenderObject() as RenderBox;

    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final selected = await showMenu<PopupMenuModel>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx, offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width, offset.dy),
      items: widget.menuItems.map((option) {
        return PopupMenuItem<PopupMenuModel>(value: option, height: 35,
          child: Row(children: [
              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
              Icon(option.icon, size: Dimensions.fontSizeLarge,
                color: Theme.of(context).iconTheme.color),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Text(option.title.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
            ]),
        );
      }).toList(),
      color: Theme.of(context).cardColor,
    );


    if (selected != null) {
      widget.onSelected?.call(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget trigger = Padding(
      key: _key,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
      child: widget.child ??
          Icon(Icons.more_vert_rounded, color: Theme.of(context).hintColor));

    if (!widget.openOnHover) {
      return PopupMenuButton<PopupMenuModel>(
        itemBuilder: (_) => [],
        child: trigger,
      );
    }

    return MouseRegion(onEnter: (_) => _openMenu(),
      child: trigger,
    );
  }
}
