import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/price_converter.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class StatisticsCardsWidget extends StatelessWidget {
  const StatisticsCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (reportController) {
      DashboardReportModel? dashboardReportModel = reportController.dashboardReportModel;
      final stats = dashboardReportModel?.data?.cards;




        return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(spacing: Dimensions.fontSizeDefault,
            crossAxisAlignment: CrossAxisAlignment.start, children: [


            ResponsiveMasonryGrid(children: [
              OrderSummeryCardWidget(count: stats?.applications??0,
                  textColor: systemPrimaryColor(),
                  title: "total_applications".tr, cardColor: Color(0xFFECF0FD),
                   icon: Images.application),

              OrderSummeryCardWidget(count: stats?.shortlisted??0,
                  cardColor: Color(0xFFFCF1C5),
                  textColor: Colors.orange,
                  title: "shortlisted".tr, icon: Images.shortlisted),

              OrderSummeryCardWidget(count: stats?.hired??0,
                  cardColor: Color(0xFFCFF8E3),
                  textColor: Colors.green,
                  title: "hired".tr, icon: Images.hired),

              OrderSummeryCardWidget(count: stats?.rejected??0,
                  cardColor: Color(0xFFFCE0E0),
                  textColor: Colors.red,
                  title: "rejected".tr, icon: Images.rejected),



            ]),
            ],
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
    return CustomContainer(borderRadius: 15,
        verticalPadding: Dimensions.paddingSizeDefault,
        horizontalPadding: Dimensions.paddingSizeDefault,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Row(spacing: Dimensions.paddingSizeSmall, children: [


            if(value != null)
              Expanded(
                child: Text(PriceConverter.convertPrice(context, value!),
                    style: textBold.copyWith(fontSize: Dimensions.fontSizeOverLarge,
                        color: textColor)),
              ),
            if(count != null)
              Expanded(
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(count.toString(), style: textBold.copyWith(color: textColor,
                      fontSize: Dimensions.fontSizeOverLarge)),
                ),
              ),
              CustomContainer(color: cardColor,showShadow: false,
                  child: CustomImage(width: 25, image: icon, isLocalAsset: true,)),
            ]),

          Text(title, style: textRegular.copyWith(color: textColor)),
              CustomDivider(),
              Row(spacing: 5, children: [
                  Icon(Icons.calendar_month_sharp, color: systemPrimaryColor(),size: 14),
                  Text("updated_today".tr, style: textRegular.copyWith()),
                ],
              )


    ]));
  }
}


