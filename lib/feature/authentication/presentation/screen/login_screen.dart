import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/authentication/logic/authentication_controller.dart';
import 'package:ecommerce/helper/route_helper.dart';

import '../widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    if (Get.find<AuthenticationController>().isLoggedIn()) {
      Future.delayed(const Duration(milliseconds: 1), () {
        Get.offAllNamed(RouteHelper.getDashboardRoute());
      });
    }

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        Container(decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              systemPrimaryColor(),
              systemPrimaryColor().withValues(alpha: .85),
              systemPrimaryColor().withValues(alpha: .75),
            ]))),



        Positioned(top: -100, left: -50,
            child: _floatingCircle(250, Colors.white.withValues(alpha: 0.05), 30)),
        Positioned(bottom: -120,
          right: -80,
          child: _floatingCircle(300, Colors.white.withValues(alpha: 0.04), -25)),


        Center(child: CustomContainer(
          child: Padding(padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.isDesktop(context)?24: Dimensions.paddingSizeDefault),
            child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 320,
                maxHeight: 450),
              child: GetBuilder<AuthenticationController>(builder: (_) {
                return const LoginWidget();
                }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingCircle(double size, Color color, double movement) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(offset: Offset(
          0, movement * _controller.value),
          child: Container(height: size, width: size,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        );
      },
    );
  }
}
