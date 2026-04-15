import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_toggle_switch.dart';
import 'package:mighty_job/feature/profile/domain/model/status_update_body.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';


class ActiveInActiveWidget extends StatelessWidget {
  final bool active;
  final ValueChanged<bool>? onChanged;

  const ActiveInActiveWidget({super.key, required this.active, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: MouseRegion(cursor: SystemMouseCursors.click,
        child: CustomToggleSwitch(
          value: active, onChanged: onChanged, width: 40, height: 20,
            activeColor: systemPrimaryColor(), inactiveColor: Theme.of(context).hintColor),
      ));
  }
}

void updateStatus({
  required bool value,
  required String id,
  required String type,
  Future<void> Function()? onSuccess,
}) {
  StatusUpdateBody body = StatusUpdateBody(
    status: value ? "1" : "0",
    id: int.parse(id),
    type: type,
  );

  Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
    if (onSuccess != null) await onSuccess();
  });
}

