import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/controller/splash_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // _route();
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _controller;
  late Animation<double> _animation;


  // Future<void> _route() async {
  //   if(Get.find<AuthenticationController>().isLoggedIn()){
  //       Get.find<ProfileController>().getProfileInfo();
  //       Future.delayed(const Duration(milliseconds: 2000),() => Get.offAllNamed(RouteHelper.getDashboardRoute()),);
  //   }else{
  //     Future.delayed(const Duration(milliseconds: 10),() => Get.offAllNamed(RouteHelper.getInitialRoute()),);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: systemPrimaryColor(),
      body: GetBuilder<SplashController>(builder: (splashController) {
          return Stack(children: [

              // Main content
              Center(child: Padding(padding: const EdgeInsets.all(50.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      // Logo with elegant fade-in animation (no rotation)
                      FadeTransition(opacity: _animation,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha:0.1),
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.white.withValues(alpha:0.2),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha:0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              Images.logo,
                              width: 80,
                              height: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // App title with glow effect
                      FadeTransition(
                        opacity: _animation,
                        child: Text(
                          AppConstants.appName,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.white.withValues(alpha:0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Subtitle
                      FadeTransition(
                        opacity: _animation,
                        child: Text(
                          'Complete ecommerce Management System',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withValues(alpha:0.9),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Version info at bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: FadeTransition(
                    opacity: _animation,
                    child: Text(
                      "${AppConstants.appName} ${"version".tr} : ${AppConstants.version}",
                      style: textRegular.copyWith(
                        color: Colors.white.withValues(alpha:0.8),
                        fontSize: Dimensions.fontSizeSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
