import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/candidate_panel/screens/edit_address_details_screen.dart';
import 'package:job/feature/candidate_panel/widgets/address_details_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title:"address_details".tr, actions: [
      IconButton(onPressed: (){
        Get.to(()=> EditAddressDetailsScreen());
      }, icon: CustomImage(image:Images.edit, isLocalAsset: true,
        height: 25, svgColor: Colors.white))
    ]),
    body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: AddressDetailsWidget(),
      ))
    ]));
  }
}
