import 'package:mighty_job/common/widget/custom_popup_menu.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/dashboard/controller/dashboard_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/support_ticket_model.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';


class SupportTicketItemWidget extends StatelessWidget {
  final SupportTicketItem supportTicketModel;
  final int index;
   const SupportTicketItemWidget({super.key, required this.supportTicketModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: supportTicketModel.title??'')),
      Expanded(child: CustomTextItemWidget(text: supportTicketModel.status?.toLowerCase() == 'open' ? "open".tr : "closed".tr,)),
      Expanded(child: CustomTextItemWidget(text: DateConverter.dateTimeStringToMonthAndYear(
          supportTicketModel.createdAt?? DateTime.now().toString()),)),

      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(supportTicket: true),
      onSelected: (val){
        if(val.title == "view".tr){
          Get.toNamed(RouteHelper.getTicketDetailRoute(supportTicketModel.id!.toString()));
        }else{
          Get.dialog(ConfirmationDialog(title: "close",
              content: "are_you_sure_want_to_close_this_ticket".tr,
              onTap: (){
                Get.back();
                Get.find<SupportTicketController>().closeTicket(supportTicketModel.id!.toString());
              }));
        }
      }),
    ]):

    Padding(
      padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,
          Dimensions.paddingSizeSmall, 0),
      child: Slidable(key: const ValueKey(0),
        endActionPane: ActionPane(extentRatio:supportTicketModel.status == 'close'? 0.01 : .30,
          motion: const ScrollMotion(), children: [
            if(supportTicketModel.status != 'close')
            SlidableAction(onPressed: (value){
                Get.find<SupportTicketController>().closeTicket(supportTicketModel.id!.toString());
              },
              backgroundColor: Theme.of(context).colorScheme.error.withValues(alpha:.05),
              foregroundColor: Theme.of(context).colorScheme.error.withValues(alpha:.75),
              icon: CupertinoIcons.clear,
              label: "close".tr)]),
        child: GestureDetector(
          onLongPress: () {
            if(supportTicketModel.status != 'close'){
              Get.dialog(ConfirmationDialog(
                  title: "close",
                  content: "close",
                  onTap: (){
                    Get.back();
                    Get.find<SupportTicketController>().closeTicket(supportTicketModel.id!.toString());

                  }));
            }
          },
          onTap: () {
            Get.toNamed(RouteHelper.getTicketDetailRoute(supportTicketModel.id!.toString()));
          },
          child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                border: Border.all(color: systemPrimaryColor().withValues(alpha:.25),
                    width: .5)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [


              Row(children: [
                Expanded(child: Text(supportTicketModel.title??'N/A',
                    style: textSemiBold.copyWith())),

                Container(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                    vertical: Dimensions.paddingSizeExtraSmall),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                        color: supportTicketModel.status?.toLowerCase() == 'open' ?
                        Colors.green.withValues(alpha:.125) :supportTicketModel.status == 'pending' ?
                        systemPrimaryColor().withValues(alpha:.125) :
                        Theme.of(context).colorScheme.error.withValues(alpha:.125)),

                    child: Text(
                    supportTicketModel.status?.toLowerCase() == 'open' ? "open" :
                    "closed".tr,
                        style: textRegular.copyWith(color: supportTicketModel.status?.toLowerCase() == 'open' ?
                        Colors.green  : Theme.of(context).colorScheme.error)))]),

              Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
                child: Text(supportTicketModel.description??'', style: textRegular),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
