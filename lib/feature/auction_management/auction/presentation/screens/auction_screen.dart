
import 'package:ecommerce/feature/auction_management/auction/presentation/screens/create_new_auction_screen.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/auction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';

class AuctionScreen extends StatefulWidget {
  const AuctionScreen({super.key});

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "auction".tr),
        body: CustomWebScrollView(controller: scrollController, slivers: [

          SliverToBoxAdapter(child: AuctionListWidget(scrollController: scrollController),)
        ],),
        floatingActionButton:  CustomFloatingButton(
            onTap: ()=> Get.to(()=> const CreateNewAuctionScreen()))
    );
  }
}



