
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/candidate_base_layout.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/secure_pdf_viwer/video_pdf_and_image_viewer_widget.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/common/widget/no_data_found.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:job/feature/candidate_resume/presentation/widgets/add_new_candidate_resume_widget.dart';
import 'package:job/feature/candidate_resume/presentation/widgets/resaume_stats_card.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CandidateResumeScreen extends StatefulWidget {
  const CandidateResumeScreen({super.key});

  @override
  State<CandidateResumeScreen> createState() => _CandidateResumeScreenState();
}

class _CandidateResumeScreenState extends State<CandidateResumeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Get.find<CandidateResumeController>().getCandidateResumeList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CandidateBaseLayout(scrollController: scrollController,
        child: GetBuilder<CandidateResumeController>(
          builder: (controller) {
            final model = controller.candidateResumeModel;
            final data = model?.data?.data;
            return CustomContainer(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("customised_cv".tr, style: sectionHeadingTextStyle(context)),
                Text("check_your_customised_cv".tr),
                Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                  child: CustomDivider()),

                ResponsiveMasonryGrid(children: [

                  ResumeStatsCard(icon: Icons.person_pin_circle_sharp,
                      color: Color(0xFFF3F8FA),
                      title: "viewed_by_employer".tr, value: "440"),

                  ResumeStatsCard(icon: Icons.download,
                    title: "download".tr,
                      color: Color(0xFFFAF9F0),
                    value: "10"),

                  ResumeStatsCard(icon: Icons.email,
                    title: "emailed".tr,
                      color: Color(0xFFF0FAFA),
                    value: "20"),

                  ],
                ),

                SizedBox(height: Dimensions.paddingSizeDefault,),
                (data != null && data.isNotEmpty == true)?
                CustomContainer(
                    child: Column(children: [
                      Row(spacing: Dimensions.paddingSizeLarge, children: [
                        Expanded(child: Text("your_customized_cv".tr, style: sectionHeadingTextStyle(context))),
                        Row(children: [
                          CustomIconTextButton(icon: Images.delete, text: "delete".tr,
                              onTap: (){
                            Get.find<CandidateResumeController>().deleteCandidateResume(data.first.id!);
                              }),
                          CustomIconTextButton(icon: Images.download,
                            text: controller.isDownloading ? "downloading..." : "download".tr,
                            onTap: controller.isDownloading ? null : () {
                              controller.downloadFile(url: "${AppConstants.imageBaseUrl}/resumes/${data.first.filePath}",
                                fileName: data.first.filePath ?? "resume.pdf");
                            },
                          ),
                          CustomIconTextButton(icon: Images.newTab,text: "open_new_tab".tr,
                              onTap: (){
                            AppConstants.openUrl("${AppConstants.imageBaseUrl}/resumes/${data.first.filePath}");
                          }),
                        ])
                      ]),
                        PdfViewerWidget(pdfUrl: "${AppConstants.imageBaseUrl}/resumes/${data.first.filePath}"),
                      ],
                    )): NoDataFound(
                      title: "no_resume_found".tr,
                      description: "create_your_customised_cv".tr,
                      buttonText: "add_customized_cv".tr,
                      onTap: (){
                        Get.dialog(CustomDialogWidget(title: "resume".tr,
                            child: AddNewCandidateResumeWidget()));
                      },
                    )

              ]),
            );
          }
        )),
    );
  }
}
