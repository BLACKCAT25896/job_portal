
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/no_data_found.dart';
import 'package:mighty_job/common/widget/paginated_list_widget.dart';
import 'package:mighty_job/feature/notification/logic/notification_controller.dart';
import 'package:mighty_job/feature/notification/presentation/widgets/notification_item.dart';

class NotificationListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const NotificationListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      initState: (state) async {
        Get.find<NotificationController>().getNotificationList(1);
        },
        builder: (notificationController) {
          return CustomContainer(color: ResponsiveHelper.isDesktop(context)? Theme.of(context).cardColor : Theme.of(context).scaffoldBackgroundColor, showShadow: false,
            child: Column(children: [
              if(ResponsiveHelper.isDesktop(context))...[
                CustomTitle(title: "notifications", fontSize: Dimensions.fontSizeExtraLarge,),
                SizedBox(height: Dimensions.paddingSizeDefault)
              ],
              notificationController.notificationModel != null? (notificationController.notificationModel!.data!= null && notificationController.notificationModel!.data!.data!.isNotEmpty)?
              PaginatedListWidget(scrollController: scrollController,
                  onPaginate: (int? offset) async {
                    await notificationController.getNotificationList(offset??1);
                  }, totalSize: notificationController.notificationModel?.data?.total??0,
                  offset: notificationController.notificationModel?.data?.currentPage??0,
                  itemView: ListView.builder(
                      itemCount: notificationController.notificationModel?.data?.data?.length??0,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return NotificationItemWidget(index: index,
                          notificationItem: notificationController.notificationModel?.data?.data?[index],);
                      })) :

              Padding(padding: EdgeInsets.only(top: Get.height/4),
                child: const Center(child: NoDataFound()),):

              Padding(padding: EdgeInsets.only(top: Get.height / 4),
                  child: const CircularProgressIndicator()),
            ],),
          );
        }
    );
  }
}
