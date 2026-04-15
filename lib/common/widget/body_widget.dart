import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/app_bar_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class BodyWidget extends StatefulWidget {
  final Widget body;
  final AppBarWidget? appBar;
  final double topMargin;
  const BodyWidget({super.key, required this.body,  this.appBar, this.topMargin = 10});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      widget.appBar??const SizedBox(),
      Expanded(child: Container(margin: EdgeInsets.only(top: widget.topMargin), clipBehavior: Clip.none,
          width: Dimensions.webMaxWidth,
        decoration:  BoxDecoration(borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          color: Theme.of(context).scaffoldBackgroundColor),
        child: ClipRRect(borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: widget.body))),

    ]);
  }
}
