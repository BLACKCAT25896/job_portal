import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/domain/models/frontend_policy_model.dart';
import 'package:job/feature/frontend/policy_enum.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class PolicyScreen extends StatefulWidget {
  final PolicyEnum policyType;

  const PolicyScreen({super.key, required this.policyType});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.find<LandingPageController>().getPolicy(widget.policyType);
  }

  String _getTitle() {
    switch (widget.policyType) {
      case PolicyEnum.termsOfService:
        return 'terms_and_conditions'.tr;
      case PolicyEnum.privacyPolicy:
        return 'privacy_policy'.tr;
      case PolicyEnum.cookiePolicy:
        return 'cookie_policy'.tr;
      case PolicyEnum.aboutUs:
        throw SizedBox();
    }
  }

  FrontendPolicyModel? _getPolicyModel(LandingPageController controller) {
    switch (widget.policyType) {
      case PolicyEnum.termsOfService:
        return controller.termsPolicyModel;
      case PolicyEnum.privacyPolicy:
        return controller.privacyPolicyModel;
      case PolicyEnum.cookiePolicy:
        return controller.cookiePolicyModel;
      case PolicyEnum.aboutUs:
        throw SizedBox();
    }
  }

  Widget _buildContent(LandingPageController controller) {
    final model = _getPolicyModel(controller);
    String? data = model?.data?.description;

    if (data == null || data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    data = data.replaceAll('href=', 'target="_blank" href=');

    return Padding(padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(_getTitle(), style: textMedium.copyWith(
              fontSize: Dimensions.fontSizeLarge)),
          const SizedBox(height: 12),
          Html(data: data, style: {
              "p": Style(fontSize: FontSize.medium),
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final body = GetBuilder<LandingPageController>(
      builder: (controller) => _buildContent(controller));

    return isDesktop ? BaseLayout(scrollController: _scrollController,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth, child: body))) :
    Scaffold(appBar: AppBar(title: Text(_getTitle())),
      body: body);
  }
}