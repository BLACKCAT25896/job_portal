import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/logic/auction_controller.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/auction_item_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/create_new_auction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';

class AuctionListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AuctionListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(
      initState: (val) => Get.find<AuctionController>().getAuction(1),
      builder: (controller) {
        final model = controller.auctionModel;
        final data = model?.data;

        return GenericListSection<AuctionItem>(
          sectionTitle: "auction".tr,
          addNewTitle: "add_new_auction".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(
            title: "auction".tr,width: 1000,
              child: const CreateNewAuctionWidget()),),
          headings: const ["image", "product", "variant",'start_date',"end_date", "start_price","reserve_price"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getAuction(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => AuctionItemWidget(index: index, auctionItem: item),
        );
      },
    );
  }
}
