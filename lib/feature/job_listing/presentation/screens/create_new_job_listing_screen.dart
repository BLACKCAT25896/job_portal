
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/add_new_job_listing_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewJobListingScreen extends StatefulWidget {
  final JobListingItem? listingItem;
  const CreateNewJobListingScreen({super.key, this.listingItem});

  @override
  State<CreateNewJobListingScreen> createState() => _CreateNewJobListingScreenState();
}

class _CreateNewJobListingScreenState extends State<CreateNewJobListingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "job_listing".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "job_listing".tr,
              pathItems: ["add_new_listing".tr]),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewJobListingWidget(listingItem: widget.listingItem),
            ),
          ],
        ))
      ],),
    );
  }
}
