import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/enum/action_type.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/search_product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/search_product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_quantity_section.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';



class PosItemWidget extends StatefulWidget {
  final Products? product;
  final int index;
  final ProductActionType actionType;
  final bool isStock;
  const PosItemWidget({super.key,  required this.index, this.product, required this.actionType, this.isStock = false});

  @override
  State<PosItemWidget> createState() => _PosItemWidgetState();
}

class _PosItemWidgetState extends State<PosItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    GetBuilder<SearchProductController>(builder: (searchProductController) {
      return Container(decoration: BoxDecoration(color: Theme.of(context).cardColor),
        padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeExtraSmall,2,0,2),
        child: Column(children: [

          Row(children: [
            const SizedBox(width: 10),
            Expanded(flex: 5, child: Text('${widget.product?.name}',
              maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),)),
            if(widget.isStock)
              Expanded(flex: 5,
                  child: Text('${widget.product?.stockQuantity??0}', maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),)),


            InkWell(onTap : () {
              if(widget.product!.quantity! > 1){
                searchProductController.setProductQuantity(widget.index,
                    widget.product!.quantity!-1, widget.actionType ==
                        ProductActionType.purchase, notify: true);
              }
              }, child: Container(width: 30, height: 35, decoration: BoxDecoration(
                    color: widget.product!.quantity! > 1? systemPrimaryColor() :
                    Theme.of(context).hintColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),
                        bottomLeft:  Radius.circular(5))
                ), child: const Icon(Icons.remove, size: 13,color: Colors.white),)),


            Expanded(flex: 2, child: ProductQuantitySection(product: widget.product,
                    index: widget.index, actionType: widget.actionType)),

            InkWell(onTap : () => searchProductController.setProductQuantity(widget.index,
                widget.product!.quantity! + 1, widget.actionType ==
                    ProductActionType.purchase, notify: true),
                child: Container( width: 30, height: 35, decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(5),
                        bottomRight:  Radius.circular(5))),
                     child: const Icon(Icons.add, size: 13,),)),

                const SizedBox(width: Dimensions.paddingSizeDefault),

                widget.actionType == ProductActionType.stock?
                    EditDeleteSection(onDelete: (){
                      Get.find<SearchProductController>().removeProduct(widget.index,
                          widget.actionType == ProductActionType.purchase);
                    }):
                Expanded(flex: 2, child: Text(PriceConverter.convertPrice(context,
                    (widget.actionType == ProductActionType.purchase)? widget.product!.cost! :
                    widget.product!.price!), style: textRegular.copyWith())),
              ],),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),

            ],
            ),
          );
        }
    ):
    Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(motion: const ScrollMotion(), extentRatio: 0.2, children: [
          SlidableAction(onPressed: (context) {
            Get.find<SearchProductController>().removeProduct(widget.index,
                widget.actionType == ProductActionType.purchase);
          },
              backgroundColor: Theme.of(context).colorScheme.error.withValues(alpha: .1),
              icon: CupertinoIcons.delete,
            foregroundColor: Colors.red,)]),

        startActionPane: ActionPane(motion: const ScrollMotion(), extentRatio: 0.2, children: [
          SlidableAction(onPressed: (context) {
            Get.find<SearchProductController>().removeProduct(widget.index,
                widget.actionType == ProductActionType.purchase);
          },
            backgroundColor: Theme.of(context).colorScheme.error.withValues(alpha: .1),
            icon: CupertinoIcons.delete,
            foregroundColor: Theme.of(context).colorScheme.error, )]),

        child: GetBuilder<SearchProductController>(
          builder: (searchProductController) {
            return Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              padding: const EdgeInsets.fromLTRB( Dimensions.paddingSizeExtraSmall,2,0,2),
              child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 10),
                    Expanded(flex: 5,
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [

                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('${widget.product?.name}', maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                              Text('${"stock".tr}: ${widget.product?.stockQuantity??0}',
                                maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
                            ],
                          )),
                        ])),


                    InkWell(onTap : () {
                      if(widget.product!.quantity! > 1){
                        searchProductController.setProductQuantity(widget.index,
                            widget.product!.quantity!-1, widget.actionType == ProductActionType.purchase, notify: true);
                      }
                    }, child: Container(width: 30, height: 35,
                      decoration: BoxDecoration(color: widget.product!.quantity! > 1?
                      systemPrimaryColor() : Theme.of(context).hintColor,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),
                              bottomLeft:  Radius.circular(5))),
                      child: const Icon(Icons.remove, size: 13,color: Colors.white),)),

                    Expanded(flex: 2, child: ProductQuantitySection(product: widget.product,
                        index: widget.index, actionType: widget.actionType)),

                    InkWell(onTap : () => searchProductController.setProductQuantity(widget.index,
                        widget.product!.quantity! + 1, widget.actionType == ProductActionType.purchase, notify: true),
                        child: Container( width: 30, height: 35, decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(5),
                                bottomRight:  Radius.circular(5))),
                         child: const Icon(Icons.add, size: 13,),)),


                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    widget.actionType == ProductActionType.sale?
                    Expanded(flex: 2,
                      child: CustomTextField(
                        controller: widget.product?.amountController,
                        focusNode: widget.product?.focusNode,
                        hintText: "0",
                        onChanged: (val) {
                          final controller = widget.product?.amountController;
                          final focusNode = widget.product?.focusNode;
                          if (controller != null && focusNode != null) {
                            int cursorPosition = controller.selection.baseOffset;
                            searchProductController.changePrice(widget.index, val);
                            controller.value = controller.value.copyWith(text: val,
                                selection: TextSelection.collapsed(offset: cursorPosition));
                            focusNode.requestFocus();}
                        })):
                    Expanded(flex: 2, child: Text((widget.actionType == ProductActionType.purchase)?
                    double.parse(widget.product!.cost!.toString()).toStringAsFixed(2) :
                    double.parse(widget.product!.price!.toString()).toStringAsFixed(2) ,
                        style: textRegular.copyWith())),
                  ],),
                  const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
