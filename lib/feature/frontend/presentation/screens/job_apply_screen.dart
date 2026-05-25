
import 'package:flutter/material.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/feature/frontend/presentation/widgets/job_apply_section/job_and_candidate_information_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job_apply_section/monthly_job_apply_limit_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:get/get.dart';

class JobApplyScreen extends StatefulWidget {
  const JobApplyScreen({super.key});

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    BaseLayout(scrollController: scrollController,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeDefault, children: [

                  MonthlyJobApplyLimitWidget(),

                  JobAndCandidateInformationWidget(),

                  Row(spacing: Dimensions.paddingSizeDefault,
                    mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                        width: 120, child: CustomButton(
                      buttonColor: Theme.of(context).cardColor,
                      borderColor: systemPrimaryColor(),
                      textColor: systemPrimaryColor(),
                        onTap: (){
                        Get.back();
                        }, text: "close".tr)),
                    SizedBox(width: 120, child: CustomButton(onTap: (){

                    }, text: "apply".tr)),
                  ],)

            ]),
          ),
        ),
      )):Scaffold(
      appBar: CustomAppBar(title: "apply_online".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            MonthlyJobApplyLimitWidget(),

            JobAndCandidateInformationWidget(),

            Row(spacing: Dimensions.paddingSizeDefault,
              mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                    width: 120, child: CustomButton(
                    buttonColor: Theme.of(context).cardColor,
                    borderColor: systemPrimaryColor(),
                    textColor: systemPrimaryColor(),
                    onTap: (){
                      Get.back();
                    }, text: "close".tr)),
                SizedBox(width: 120, child: CustomButton(onTap: (){

                }, text: "apply".tr)),
              ],)
          ]),
        ))
      ]),
    );
  }
}


