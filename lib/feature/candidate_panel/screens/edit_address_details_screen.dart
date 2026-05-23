import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/candidate_panel/widgets/edit_address_details_widget.dart';
import 'package:job/util/dimensions.dart';

class EditAddressDetailsScreen extends StatelessWidget {
  const EditAddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"address_details".tr, actions: [
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Column(children: [
          EditAddressDetailsWidget()
        ]),
      ))
    ]));
  }
}
