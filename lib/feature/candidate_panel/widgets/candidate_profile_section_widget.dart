import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateProfileSectionWidget extends StatelessWidget {
  const CandidateProfileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(builder: (controller) {
      final sections = controller.sections;
        return CustomContainer(color: Theme.of(context).scaffoldBackgroundColor,
          verticalPadding: 0, horizontalPadding: 0,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeDefault, children: [
              MasonryGridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sections.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230),
                  itemBuilder: (_, index){
                    final selected = controller.selectedSection == controller.sections[index];
                return CustomContainer(borderRadius: 0,showShadow: false,
                  color: selected? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).cardColor,
                  onTap: ()=> controller.selectSection(controller.sections[index]),
                  child: Column(children: [
                      Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                        Icon(controller.sections[index].icon, color: selected? systemPrimaryColor():
                        Theme.of(context).hintColor),
                        Text(controller.sections[index].name.tr,
                            style: textRegular.copyWith(
                                color: selected? systemPrimaryColor():  Theme.of(context).hintColor))
                      ]),
                    ],
                  ),
                );
                  }),
              Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: SizedBox(height: 45,

                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, index){
                        final selected = controller.selectedSection!.subSection[index] == controller.selectedSubSection;
                        return CustomContainer(color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border(bottom: BorderSide(color: selected?
                          systemPrimaryColor(): Colors.transparent, width: 5,style: BorderStyle.solid)),
                          onTap: ()=> controller.setSubSection(controller.selectedSection!.subSection[index]),
                          showShadow: false,borderRadius: 0,
                          child: Text(controller.selectedSection!.subSection[index].name.tr,
                              style: textRegular),
                        );
                      }, separatorBuilder: (_, index){
                    return SizedBox(width: Dimensions.paddingSizeDefault,);
                  }, itemCount: controller.selectedSection!.subSection.length),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
