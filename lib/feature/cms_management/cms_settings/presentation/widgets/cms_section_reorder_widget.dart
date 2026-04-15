import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/cms_section_model.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/cms_section_reorder_body.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CmsSectionReorderWidget extends StatefulWidget {
  const CmsSectionReorderWidget({super.key});

  @override
  State<CmsSectionReorderWidget> createState() => _CmsSectionReorderWidgetState();
}

class _CmsSectionReorderWidgetState extends State<CmsSectionReorderWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
        initState: (val)=> Get.find<SystemSettingsController>().getCmsSection(),
        builder: (systemSettingController) {
          CmsSectionModel? sectionModel = systemSettingController.cmsSectionModel;
          return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(mainAxisSize: MainAxisSize.min, children: [

              (sectionModel != null && sectionModel.data != null && sectionModel.data!.isNotEmpty)?
              ReorderableListView.builder(
                  shrinkWrap: true,
                  buildDefaultDragHandles: false,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: sectionModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    SectionItem? section = sectionModel.data?[index];
                    return Padding(key: ValueKey(index),
                      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                      child: CustomContainer(showShadow: false, borderRadius: 5,
                        child: MouseRegion(cursor: SystemMouseCursors.grab,
                          child: ReorderableDragStartListener(index: index,
                              child: Row(spacing: Dimensions.paddingSizeSmall, children: [
                                  Icon(Icons.grid_view_rounded, color: Theme.of(context).hintColor),
                                  Expanded(child: Text("${section?.name?.replaceAll("_", " ").capitalize}", style: textRegular.copyWith())),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final movedItem = sectionModel.data?.removeAt(oldIndex);
                    sectionModel.data?.insert(newIndex, movedItem!);
                    List<Sections> reorderSections = sectionModel.data!.asMap().entries.map((entry) {
                      final index = entry.key;
                      final section = entry.value;
                      section.serial = index + 1;
                      return Sections(id: section.id, serial: section.serial);
                    }).toList();
                    CmsSectionReorderBody body = CmsSectionReorderBody(sections: reorderSections);
                    systemSettingController.reorderCmsSection(body);
                  }
              ):Center(child: CircularProgressIndicator()),

            ]),
          );
        }
    );
  }
}
