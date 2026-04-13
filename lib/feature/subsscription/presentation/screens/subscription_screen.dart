import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/subsscription/presentation/widgets/subscription_button_widget.dart';
import 'package:ecommerce/feature/subsscription/presentation/widgets/subscription_package_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "packages".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SubscriptionPackageWidget(),
        ),)
      ],),

      bottomNavigationBar: ResponsiveHelper.isDesktop(context)? SizedBox() : CustomContainer(borderRadius: 0, child: SubscriptionButtonWidget()),
    );
  }
}
