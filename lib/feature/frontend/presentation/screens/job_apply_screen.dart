import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class JobApplyScreen extends StatefulWidget {
  const JobApplyScreen({super.key});

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController monthlySalaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeDefault, children: [

              CustomContainer(verticalPadding: Dimensions.paddingSizeDefault,
                  horizontalPadding: Dimensions.paddingSizeDefault, child: Row(children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Job Application Limit:', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

                        const SizedBox(height: 12),
                      SizedBox(width: 120, height: 70,
                        child: Stack(alignment: Alignment.bottomCenter, children: [
                          CustomPaint(size: const Size(120, 70), painter: _GaugePainter(value: 0, max: 75)),

                          Positioned(bottom: 0,
                            child: Column(children: [
                                  Text('Monthly', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                                  Text('0 / 75', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                                        ],
                                      ),
                    ),

                    Column(spacing: Dimensions.paddingSizeDefault,
                        crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text("get_pro_and_buy_more_applications_anytime".tr),
                      SizedBox(width: 220,
                        child: CustomButton(
                          buttonColor: Theme.of(context).cardColor,
                          borderColor: systemPrimaryColor(),
                            textColor: systemPrimaryColor(),
                            onTap: (){

                        }, text: "buy_more_applications".tr),
                      )
                    ])

              ])),
              CustomContainer(child: GetBuilder<LandingPageController>(
                builder: (controller) {
                  final model = controller.jobDetailsModel;
                  final data = model?.data;
                  final job = data?.job;
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: Dimensions.paddingSizeDefault, children: [
                    Text(job?.company?.name??'N/A', style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
                    Text(job?.jobTitle??'N/A', style: textSemiBold.copyWith(
                        color: systemPrimaryColor(), fontSize: Dimensions.fontSizeExtraLarge)),

                    CustomDivider(),
                    GetBuilder<ProfileController>(
                      builder: (controller) {
                        final model = controller.profileModel;
                        final data = model?.data;

                        return Row(spacing: Dimensions.paddingSizeDefault, children: [
                          CustomImage(width: 50,height: 50, radius: 120,
                              image: "${AppConstants.imageBaseUrl}/profile/${data?.image}"),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(data?.name??'N/A', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                              Row(spacing: Dimensions.paddingSizeDefault, children: [

                                Row(spacing: Dimensions.paddingSizeExtraSmall,
                                  children: [
                                    Icon(Icons.email, size: 18, color: systemPrimaryColor()),
                                    Text(data?.email??'N/A', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                                  ],
                                ),

                                Row(spacing: Dimensions.paddingSizeExtraSmall,
                                  children: [
                                    Icon(Icons.phone, size: 18, color: systemPrimaryColor()),
                                    Text(data?.phone??'N/A', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                                  ],
                                ),
                              ])
                            ]),
                          ),
                          Row(spacing: Dimensions.paddingSizeSmall, children: [
                            CustomImage(width: 20, height: 20, image:Images.edit),
                            Text("edit".tr, style: textRegular.copyWith(color: systemPrimaryColor()))
                          ])
                        ]);
                      }
                    ),

                    CustomTextField(
                        controller: monthlySalaryController,
                        hintText: "e.g. 50000",title: "your_expected_salary_monthly".tr),

                    CustomContainer(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

                      Row(children: [
                        Expanded(
                          child: Row(spacing: 5, children: [
                            Icon(Icons.file_copy, color: systemPrimaryColor(),size: 18),
                            Text("customized_cv", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge))
                          ]),
                        ),

                        SizedBox(width: 120,
                          child: CustomButton(borderColor: systemPrimaryColor(),
                              textColor: systemPrimaryColor(),
                              buttonColor: Theme.of(context).cardColor,
                              onTap: (){

                          }, text: "change_cv".tr),
                        )
                      ]),
                      CustomContainer(child: Row(spacing: Dimensions.paddingSizeSmall, children: [
                        CustomContainer(borderRadius: 5, child: Icon(Icons.picture_as_pdf)),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("Md.Kamrujjaman.pdf", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                          Text("uploaded_on".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
                        ])
                      ]),)
                    ]))

                  ]);
                }
              )),

                  Row(spacing: Dimensions.paddingSizeDefault,
                    mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                        width: 120, child: CustomButton(
                      buttonColor: Theme.of(context).cardColor,
                      borderColor: systemPrimaryColor(),
                      textColor: systemPrimaryColor(),
                        onTap: (){}, text: "close".tr)),
                    SizedBox(width: 120, child: CustomButton(onTap: (){}, text: "apply".tr)),
                  ],)

            ]),
          ),
        ),
      ));
  }
}

class _GaugePainter extends CustomPainter {
  final double value;
  final double max;

  const _GaugePainter({required this.value, required this.max});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.95;
    final radius = size.width / 2 - 4;
    const startAngle = math.pi;
    const sweepAngle = math.pi;

    // Track
    final trackPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      startAngle, sweepAngle, false, trackPaint,
    );

    // Progress
    final pct = (value / max).clamp(0.0, 1.0);
    if (pct > 0) {
      final progressPaint = Paint()
        ..color = const Color(0xFF3DAE6C)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: radius),
        startAngle, sweepAngle * pct, false, progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GaugePainter old) => old.value != value;
}

