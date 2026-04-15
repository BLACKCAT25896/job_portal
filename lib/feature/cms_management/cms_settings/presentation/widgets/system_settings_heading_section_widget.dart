import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/heading_type_button_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SystemSettingsHeadingSectionWidget extends StatelessWidget {
  const SystemSettingsHeadingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(builder: (systemSettingsController) {

      final List<String> titles = ["general_settings", "logo", "theme_color", "theme"];

      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: SizedBox(height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return HeadingTypeButtonWidget(title: titles[index].tr,
                selected: systemSettingsController.settingsTypeIndex == index,
                onTap: () => systemSettingsController.setSelectedSettingsTypeIndex(index),);
              },
            ),
          ),
        );
      },
    );
  }
}