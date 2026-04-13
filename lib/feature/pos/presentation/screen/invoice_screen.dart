import 'dart:io';

import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class InVoiceScreen extends StatefulWidget {

  const InVoiceScreen({super.key, });
  @override
  State<InVoiceScreen> createState() => _InVoiceScreenState();
}
class _InVoiceScreenState extends State<InVoiceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "invoice".tr, onBackPress: (){
        Get.back();
        Get.back();
        Get.back();

      }),

      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: InvoiceWidget())
      ],),
    );
  }
}
Future<bool> allowPermission() async {
  if (!await requestAndCheckPermission(Permission.location)) {
    return false;
  }
  if (!await requestAndCheckPermission(Permission.bluetooth)) {
    return false;
  }
  if (!await requestAndCheckPermission(Permission.bluetoothConnect)) {
    return false;
  }
  if (!await requestAndCheckPermission(Permission.bluetoothScan)) {
    return false;
  }

  return true;
}
Future<bool> requestAndCheckPermission(Permission permission) async {
  if (Platform.isMacOS) {
    return true;
  } else {
    await permission.request();
    var status = await permission.status;
    return !status.isDenied;
  }
}