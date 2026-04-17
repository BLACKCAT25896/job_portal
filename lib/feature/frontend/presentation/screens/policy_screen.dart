import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/domain/models/frontend_policy_model.dart';
import 'package:mighty_job/feature/frontend/policy_enum.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      scrollController: _scrollController,
      child: GetBuilder<LandingPageController>(
        builder: (policyController) {
          FrontendPolicyModel? policyModel = widget.policyType == PolicyEnum.termsOfService
              ? policyController.termsPolicyModel
              : widget.policyType == PolicyEnum.privacyPolicy
              ? policyController.privacyPolicyModel
              : policyController.cookiePolicyModel;

          String? data = policyModel?.data?.description;

          if (data != null && data.isNotEmpty) {
            data = data.replaceAll('href=', 'target="_blank" href=');

            return SizedBox(
              width: Dimensions.webMaxWidth,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (ResponsiveHelper.isDesktop(context))
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault),
                        child: Text(
                          widget.policyType == PolicyEnum.termsOfService
                              ? 'terms_and_conditions'.tr
                              : widget.policyType == PolicyEnum.privacyPolicy
                              ? 'privacy_policy'.tr
                              : 'cookie_policy'.tr,
                          style: textMedium.copyWith(
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ),
                    Html(
                      data: data,
                      style: {"p": Style(fontSize: FontSize.medium)},
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
