import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_item_text_widget.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/logic/auction_controller.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/bid_list_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/presentation/widgets/create_new_auction_widget.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class PreOrderItemWidget extends StatelessWidget {
  final AuctionItem? auctionItem;
  final int index;
  const PreOrderItemWidget({super.key, this.auctionItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    InkWell(onTap: (){
      if(auctionItem?.bids?.isNotEmpty == true){
        Get.dialog(CustomDialogWidget(title: "bids".tr,
            child: BidListWidget(
          bids: auctionItem?.bids,
          scrollController: ScrollController(),
        )));
      }else{
        showCustomSnackBar("no_bid_available".tr);
      }
    },
      child: Row(spacing: Dimensions.paddingSizeDefault, children: [
        NumberingWidget(index: index),
        CustomImage(image: "${AppConstants.imageBaseUrl}/product_items/${auctionItem?.variant?.image}",width: 40, height: 40,),
        Expanded(child: CustomItemTextWidget(text: auctionItem?.product?.name, maxLines: 2)),
        Expanded(child: CustomItemTextWidget(
            text: "${auctionItem?.variant?.attributes?.first.attributeName}-"
                "${auctionItem?.variant?.attributes?.first.attributeValue}")),
        Expanded(child: CustomItemTextWidget(text: auctionItem?.startTime)),
        Expanded(child: CustomItemTextWidget(text: auctionItem?.endTime)),
        Expanded(child: CustomItemTextWidget(text: PriceConverter.convertPrice(context, auctionItem?.startPrice??0))),
        Expanded(child: CustomItemTextWidget(text: PriceConverter.convertPrice(context, auctionItem?.reservePrice??0))),



        EditDeletePopupMenu(onDelete: (){
            Get.dialog(ConfirmationDialog(title: "auction".tr, onTap: (){
                  Get.back();
                  Get.find<AuctionController>().deleteAuction(auctionItem!.id!);
                }));
          }, onEdit: (){
          Get.dialog(CustomDialogWidget(title: "auction".tr,width: 1000,
              child: CreateNewAuctionWidget(auctionItem: auctionItem)));
        }),
      ]),
    ):
    CustomContainer(borderRadius: 5, showShadow: false,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            CustomImage(image: "${AppConstants.imageBaseUrl}/product_items/${auctionItem?.variant?.image}",
              width: 40, height: 40,),
            Expanded(child: CustomItemTextWidget(text: auctionItem?.product?.name, maxLines: 2)),

          ]),

        CustomItemTextWidget(text: auctionItem?.startTime),
        CustomItemTextWidget(text: auctionItem?.endTime),
        CustomItemTextWidget(text: PriceConverter.convertPrice(context, auctionItem?.startPrice??0)),
        CustomItemTextWidget(text: PriceConverter.convertPrice(context, auctionItem?.reservePrice??0)),

        Row(spacing: Dimensions.paddingSizeDefault, children: [

            EditDeletePopupMenu(onDelete: (){
              Get.dialog(ConfirmationDialog(title: "auction".tr, onTap: (){
                Get.back();
                Get.find<AuctionController>().deleteAuction(auctionItem!.id!);
              }));
            }, onEdit: (){
              Get.dialog(CustomDialogWidget(title: "auction".tr,
                  child: CreateNewAuctionWidget(auctionItem: auctionItem)));
            }),
          ]),
        ],
      ),
    );
  }
}