import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/cms_management/about_us/domain/model/about_us_body.dart';
import 'package:ecommerce/feature/cms_management/about_us/logic/about_us_controller.dart';
import 'package:ecommerce/feature/cms_management/about_us/presentation/widgets/about_us_image_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Get.find<AboutUsController>().getAboutUs(1);
    var aboutUs = Get.find<AboutUsController>().aboutUsModel?.data?.data?[0];
    if (aboutUs != null) {
      setState(() {
        titleController.text = aboutUs.title ?? '';
        descriptionController.text = aboutUs.description ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (aboutUsController) {
        return Column(children: [
            SectionHeaderWithPath(sectionTitle: "cms_management".tr, pathItems: ["about_us".tr]),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: CustomContainer(showShadow: false,
                child: Column(spacing: Dimensions.paddingSizeSmall, children: [

                    CustomTextField(
                      title: "title".tr,
                      hintText: "title".tr,
                      controller: titleController,
                      maxLength: 100,
                    ),

                    CustomTextField(
                      maxLines: 7,
                      minLines: 5,
                      inputType: TextInputType.multiline,
                      title: "description".tr,
                      hintText: "description".tr,
                      controller: descriptionController,
                      inputAction: TextInputAction.newline,
                      maxLength: 255,
                    ),

                    const AboutUsImageWidget(),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    aboutUsController.loading? Center(child: CircularProgressIndicator()):
                    CustomButton(
                      onTap: () {
                        String title = titleController.text.trim();
                        String description = descriptionController.text.trim();
                        AboutUsBody body = AboutUsBody(
                          title: title,
                          description: description,
                          method: 'PUT',

                        );
                        aboutUsController.editAboutUs(body, 1);

                      },
                      text: "update".tr,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}