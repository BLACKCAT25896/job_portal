import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/authentication/presentation/widgets/company_login_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/util/styles.dart';


class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: CustomContainer(borderRadius: 0, color: systemPrimaryColor(),
        child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 50),
            child: ResponsiveMasonryGrid(width: 600, children: [

                Padding(padding: const EdgeInsets.only(top: 90),
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text("Connecting Employers With Quality Candidates", style: landingTextStyle(context, color: Colors.white)),
                    Text("Manage your entire hiring process from job posting to online assessments and interviews",
                        style: textMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraLarge)),

                    SizedBox(height: Dimensions.paddingSizeLarge),
                    SizedBox(width: 200,
                      child: CustomButton(buttonColor: Colors.green,
                          onTap: (){
                        if(Get.find<AuthenticationController>().isLoggedIn()){
                          Get.toNamed(RouteHelper.getPostAJobRoute());
                        }

                          }, text: "post_a_job".tr),
                    )
                  ]),
                ),
                CustomContainer(child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                    child: const CompanyLoginWidget())),
              ],
            ),
          ),
        )),
      ),
    );
  }

}
