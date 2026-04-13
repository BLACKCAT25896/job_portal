import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';

class GenericListDialog<T> extends StatelessWidget {
  final List<T>? items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? title;
  final double? width;
  final double? height;
  final double? itemExtent;

  const GenericListDialog({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.title,
    this.width,
    this.height,
    this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    final double dialogMaxHeight = height ?? MediaQuery.of(context).size.height * 0.6;
    final double minHeight = (itemExtent ?? 60.0) * ((items?.isNotEmpty ?? false) ? 1 : 0);
    return Dialog(insetPadding: const EdgeInsets.all(20),
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth: width ?? 1200, minHeight: minHeight,
          maxHeight: dialogMaxHeight),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (title != null)
              Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: title),
            Flexible(child: ListView.builder(
                itemCount: items?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    itemBuilder(context, items![index], index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
