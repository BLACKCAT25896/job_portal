import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/logic/auction_controller.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/bid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidListWidget extends StatelessWidget {
  final List<Bids>? bids;
  final ScrollController scrollController;
  const BidListWidget({super.key, this.bids, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(builder: (controller) {
        return GenericListSection<Bids>(
          sectionTitle: "auction".tr,
         showRouteSection: false,
          headings: const [ "name","amount"],
          scrollController: scrollController,
          isLoading: false,
          totalSize: 0,
          offset:  0,
          onPaginate: (offset) async {},
          items: bids ?? [],
          itemBuilder: (item, index) => BidItemWidget(index: index, bid: item),
        );
      },
    );
  }
}
