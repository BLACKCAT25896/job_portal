import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:ecommerce/common/controller/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/route_controller.dart';
import 'package:ecommerce/common/controller/theme_controller.dart';
import 'package:ecommerce/common/model/messages.dart';
import 'package:ecommerce/helper/di_container.dart';
import 'package:ecommerce/helper/notification_helper.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:ecommerce/localization/localization_controller.dart';
import 'package:ecommerce/theme/dark_theme.dart';
import 'package:ecommerce/theme/light_theme.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:toastification/toastification.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  if(GetPlatform.isIOS || GetPlatform.isAndroid || GetPlatform.isMacOS) {
    HttpOverrides.global = MyHttpOverrides();
  }

  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  if(GetPlatform.isWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyCifalK_uMJydVsJqvNb7d9tDUDpWj3Qr0",
        authDomain: "mighty-ecommerce.firebaseapp.com",
        projectId: "mighty-ecommerce",
        storageBucket: "mighty-ecommerce.firebasestorage.app",
        messagingSenderId: "789305924846",
        appId: "1:789305924846:web:9f2e1784494c17179f27ff",
        measurementId: "G-BN99TFSDXJ"
    ));

    MetaSEO().config();
  }else {
    await Firebase.initializeApp();
  }
  Map<String, Map<String, String>> languages = await init();

  // NotificationBody? body;
  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (remoteMessage != null) {
        // body = NotificationHelper.convertNotification(remoteMessage.data);
      }
      await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }catch(_) {}

  // if (ResponsiveHelper.isWeb()) {
  //   await FacebookAuth.instance.webAndDesktopInitialize(
  //     appId: "380903914182154",
  //     cookie: true,
  //     xfbml: true,
  //     version: "v15.0",
  //   );
  // }



  runApp(MyApp(languages: languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<NetworkController>(builder: (networkController) {
            return ToastificationWrapper(
              child: GetMaterialApp(
                title: AppConstants.appName,
                debugShowCheckedModeBanner: false,
                navigatorKey: Get.key,
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
                ),
                theme: themeController.darkTheme? darkTheme : lightTheme,
                locale: localizeController.locale,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                navigatorObservers: [
                  GetObserver((routing) {
                    if (routing?.current != null) {
                      Get.find<RouteController>().updateRoute(routing!.current);
                    }}),
                ],

                translations: Messages(languages: widget.languages),
                fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
                initialRoute: RouteHelper.getInitialRoute(),
                getPages: RouteHelper.routes,
                defaultTransition: Transition.fadeIn,
                transitionDuration: const Duration(milliseconds: 400),
                builder:(context,child){
                  return SafeArea(top: false,
                      child: child!);
                },
              ),
            );
          }
        );
      },
      );
    },

    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}