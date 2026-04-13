import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/home/presentation/widget/order_status_wise_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class StatisticsCardsWidget extends StatelessWidget {
  const StatisticsCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<ReportController>(builder: (reportController) {
      DashboardReportModel? dashboardReportModel = reportController.dashboardReportModel;
      final stats = dashboardReportModel?.summary;
      final earnings = dashboardReportModel?.earnings;



        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(showShadow: false, color: isDesktop?
          Theme.of(context).cardColor: Colors.transparent,
            child: Column(spacing: Dimensions.fontSizeDefault,
              crossAxisAlignment: CrossAxisAlignment.start, children: [


              ResponsiveMasonryGrid(children: [
                OrderSummeryCardWidget(count: stats?.totalCustomers??0,
                    title: "total_customer".tr,
                     icon: Images.customer),

                OrderSummeryCardWidget(count: stats?.totalProducts??0,
                    title: "total_products".tr, icon: Images.product),

                OrderSummeryCardWidget(count: stats?.totalCategories??0,
                    title: "total_category".tr, icon: Images.category),

                OrderSummeryCardWidget(count: stats?.totalBrands??0,
                    title: "total_brands".tr, icon: Images.brand),

                OrderSummeryCardWidget(value: earnings?.totalSales ??0,
                    title: "total_sales".tr, icon: Images.sales)


              ]),

                OrderStatusWiseCount(),
              ],
            ),
          ),
        );
      },
    );
  }
}


class OrderSummeryCardWidget extends StatelessWidget {
  final double? value;
  final int? count;
  final String icon;
  final String title;
  final Color? cardColor;
  final Color? textColor;
  final String? subTitle;
  final Widget? widget;
  const OrderSummeryCardWidget({super.key,
    this.value, required this.icon, required this.title, this.subTitle, this.count,
    this.cardColor, this.textColor, this.widget});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(borderRadius: 5, color: cardColor,
        verticalPadding: Dimensions.paddingSizeDefault,
        horizontalPadding: Dimensions.paddingSizeDefault,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeDefault, children: [

          Row(spacing: Dimensions.paddingSizeSmall, children: [


            if(value != null)
              Expanded(
                child: Text(PriceConverter.convertPrice(context, value!),
                    style: textBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: textColor)),
              ),
            if(count != null)
              Expanded(
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(count.toString(), style: textBold.copyWith(color: textColor,
                      fontSize: Dimensions.fontSizeOverLarge)),
                ),
              ),
              CustomImage(width: 25, image: icon, isLocalAsset: true,),
            ]),

          Text(title, style: textSemiBold.copyWith(color: textColor,
              fontSize: Dimensions.fontSizeLarge)),


    ]));
  }
}


