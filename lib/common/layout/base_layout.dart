import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;

  const BaseLayout({super.key, required this.child, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [
      Padding(padding: const EdgeInsets.only(top: 70), // leave space for header
          child: WebSmoothScroll(controller: scrollController, scrollSpeed: 2.1,
              scrollAnimationLength: 800,
              child: SingleChildScrollView(controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                 ])))),
        ],
      ),
    );
  }
}
