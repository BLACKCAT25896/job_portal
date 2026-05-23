import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_profile_image_widget.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "upload_photo".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          CandidateProfileImageWidget()
        ]))
      ]),
    );
  }
}
