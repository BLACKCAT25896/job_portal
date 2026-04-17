import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/footer_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/landing_page_appbar.dart';
import 'package:mighty_job/util/dimensions.dart';

class BaseLayout extends StatefulWidget {
  final Widget child;
  final Widget? appbar;
  final Widget? footer;
  final ScrollController scrollController;

  const BaseLayout({super.key, required this.child, required this.scrollController, this.appbar, this.footer});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  void _onPointerScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent && widget.scrollController.hasClients) {
      final delta = event.scrollDelta.dy * 4;
      final newOffset = (widget.scrollController.offset + delta)
          .clamp(0.0, widget.scrollController.position.maxScrollExtent);
      final duration = Duration(milliseconds: (200 + delta.abs() * 0.5).clamp(100, 500).toInt());
      widget.scrollController.animateTo(newOffset, duration: duration, curve: Curves.decelerate);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(onPointerSignal: _onPointerScroll,
        child: Stack(children: [
          Padding(padding: const EdgeInsets.only(top: 150),
            child: SingleChildScrollView(
              controller: widget.scrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(spacing: Dimensions.paddingSizeDefault,
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  widget.child,
                  widget.footer ?? FooterWidget(),
                ],
              ),
            ),
          ),
          SizedBox(height: 170, width: double.infinity,
            child: widget.appbar ?? const LandingPageAppBar(),),
        ],
        ),
      ),
    );
  }
}