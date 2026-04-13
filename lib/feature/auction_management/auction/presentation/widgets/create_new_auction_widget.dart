
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/date_selection_widget.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_body.dart';
import 'package:ecommerce/feature/auction_management/auction/domain/model/auction_model.dart';
import 'package:ecommerce/feature/auction_management/auction/logic/auction_controller.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_selection_for_action_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/controller/date_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/util/dimensions.dart';


class CreateNewAuctionWidget extends StatefulWidget {
  final AuctionItem? auctionItem;
  const CreateNewAuctionWidget({super.key, this.auctionItem, });

  @override
  State<CreateNewAuctionWidget> createState() => _CreateNewAuctionWidgetState();
}

class _CreateNewAuctionWidgetState extends State<CreateNewAuctionWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  TextEditingController startPriceController = TextEditingController();
  TextEditingController reservePriceController = TextEditingController();
  TextEditingController bidIncrementController = TextEditingController();



  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.auctionItem != null){
      startPriceController.text = widget.auctionItem!.startPrice.toString();
      reservePriceController.text = widget.auctionItem!.reservePrice.toString();
      bidIncrementController.text = widget.auctionItem!.bidIncrement.toString();
      Get.find<DatePickerController>().setDateFromString(widget.auctionItem?.startTime??"");
      Get.find<DatePickerController>().setEndDateFromString(widget.auctionItem?.endTime??'');

      
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(builder: (auctionController) {
      return GetBuilder<CartController>(builder: (cartController) {
          return SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [

                    ResponsiveMasonryGrid(children: [

                      CustomTextField(
                        controller: startPriceController,
                        hintText: "start_price".tr,
                        inputType: TextInputType.number,
                        title: "start_price".tr,
                        inputFormatters: [AppConstants.numberFormat],
                      ),

                      CustomTextField(
                        controller: reservePriceController,
                        hintText: "reserve_price".tr,
                        inputType: TextInputType.number,
                        title: "reserve_price".tr,
                        inputFormatters: [AppConstants.numberFormat],
                      ),


                      CustomTextField(
                        controller: bidIncrementController,
                        hintText: "bid_increment".tr,
                        inputType: TextInputType.number,
                        title: "bid_increment".tr,
                        inputFormatters: [AppConstants.numberFormat],
                      ),

                      DateSelectionWidget(title: "start_time".tr),
                      ExpiryDateSelectionWidget(title: "end_time".tr,),


                    ]),

                    SizedBox(height: Dimensions.paddingSizeDefault),
                ProductSelectionForActionWidget(searchController: searchController,
                    scrollController: scrollController),

                SizedBox(height: Dimensions.paddingSizeDefault),

                auctionController.isLoading?
                const Center(child: CircularProgressIndicator()):
                CustomButton(onTap: (){
                  String startPrice = startPriceController.text.trim();
                  String reservePrice = reservePriceController.text.trim();
                  String bidIncrement = bidIncrementController.text.trim();
                  String startTime = Get.find<DatePickerController>().formatedFromDate;
                  String endTime = Get.find<DatePickerController>().formatedToDate;
                  String status = "pending";

                  if(cartController.selectedItems.isEmpty){
                    showCustomSnackBar("select_ingredient".tr);
                  }else if(startPrice.isEmpty){
                    showCustomSnackBar("enter_start_price".tr);
                  }else if(reservePrice.isEmpty){
                    showCustomSnackBar("enter_reserve_price".tr);
                  }else if(bidIncrement.isEmpty){
                    showCustomSnackBar("enter_bid_increment".tr);
                  }
                  else{
                    AuctionBody body = AuctionBody(
                      productItemId : cartController.selectedItems.first.id,
                      productVariantId : cartController.selectedItems.first.variants?.first.id,
                      startPrice: startPrice,
                      reservePrice: reservePrice,
                      bidIncrement: bidIncrement,
                      startTime: startTime,
                      endTime: endTime,
                      status: status,);
                    if(widget.auctionItem != null){
                      auctionController.editAuction(body, widget.auctionItem!.id!);
                    }else{
                      auctionController.createAuction(body);
                    }
                  }
                }, text: "confirm".tr)
                ]),
              ),
            );
        }
      );
      }
    );
  }
}
