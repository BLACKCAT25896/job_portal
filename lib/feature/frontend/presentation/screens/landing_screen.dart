
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<LandingPageController>(builder: (controller) {

      return SizedBox();
    },
    );
  }
}



