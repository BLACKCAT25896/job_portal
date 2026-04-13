import 'package:flutter/material.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:get/get.dart';

class ParticipantProfileScreen extends StatelessWidget {
  final String? id;

  const ParticipantProfileScreen({super.key,  this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "",),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,spacing: Dimensions.paddingSizeExtraSmall, children: [

            CustomImage(image: "https://randomuser.me/api/portraits/men/32.jpg", radius: 434, width: 90),
            const Text("Dennis Nedry", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Center(
              child: CustomContainer(showShadow: false, color: Color(0xFFC85A2C),
                verticalPadding: 8, borderRadius: 5,
                child: Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeSmall,
                  children: [
                    CustomImage(image: Images.cristal, width: 20, height: 20, isLocalAsset: true,),
                    Text("Current Rank #05", style: textRegular.copyWith(color: Colors.white)),
                  ],
                )),
            ),
            SizedBox(height: Dimensions.paddingSizeDefault),



            // Weekly Learning Activity Chart
            Align(alignment: Alignment.centerLeft,
              child: Text("weekly_learning_activity".tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
          ]),
        ))
      ],)
    );
  }


}
