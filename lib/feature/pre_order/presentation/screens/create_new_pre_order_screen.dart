import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/create_new_auction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewAuctionScreen extends StatefulWidget {
  final AuctionItem? auctionItem;
  const CreateNewAuctionScreen({super.key, this.auctionItem});

  @override
  State<CreateNewAuctionScreen> createState() => _CreateNewAuctionScreenState();
}

class _CreateNewAuctionScreenState extends State<CreateNewAuctionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "add_new_auction".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CreateNewAuctionWidget(auctionItem: widget.auctionItem),
        ),)
      ],),
    );
  }
}
