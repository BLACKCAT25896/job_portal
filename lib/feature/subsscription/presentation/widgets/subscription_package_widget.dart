import 'package:mighty_job/common/widget/custom_divider.dart';
import 'package:mighty_job/feature/subsscription/presentation/widgets/package_name_title.dart';
import 'package:mighty_job/feature/subsscription/presentation/widgets/subscription_feature_item.dart';
import 'package:mighty_job/feature/subsscription/presentation/widgets/unicorn_outline_border.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/subsscription/controller/subscription_controller.dart';
import 'package:mighty_job/feature/subsscription/domain/models/package_model.dart';
import 'package:mighty_job/feature/subsscription/presentation/widgets/subscription_item.dart';
import 'package:mighty_job/util/dimensions.dart';

class SubscriptionPackageWidget extends StatelessWidget {
  const SubscriptionPackageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
      initState: (val){
        Get.find<SubscriptionController>().getStockList();

      },
        builder: (subscriptionController) {
          PackageModel? package = subscriptionController.packageModel;
          return package != null?
          Column(children: [
            MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: package.data?.length??0,
                crossAxisCount: MediaQuery.sizeOf(context).width>1000? 3 : 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemBuilder: (context, index){
                  PackageItem? packageItem = package.data?[index];
                  return InkWell(onTap: ()=> subscriptionController.selectPackage(index),
                    child: SubscriptionItem(index: index, packageItem: packageItem),
                  );
                }),

            SizedBox(height: 50),

            if(ResponsiveHelper.isDesktop(context))
            Stack(clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(children: [

                    Row(children: [
                      Expanded(child: Text("features".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge))),
                      SizedBox(height: 80,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: package.data?.length??0,
                            itemBuilder: (context, index){
                              PackageItem? packageItem = package.data?[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: SubscriptionPackageNameTitle(index: index, packageItem: packageItem),
                              );
                            }),
                      ),SizedBox(width: 20)

                    ]),
                    CustomDivider(),
                    SubscriptionFeatureItem(title: "online_data_backup", first: true, second: true, third: true),
                    SubscriptionFeatureItem(title: "manage_domain_return", first: true, second: true, third: true),
                    SubscriptionFeatureItem(title: "low_stock_notification", first: true, second: true, third: true),
                    SubscriptionFeatureItem(title: "details_reporting", first: true, second: true, third: true),
                    SubscriptionFeatureItem(title: "due_sms", first: true, second: true, third: true),
                    SubscriptionFeatureItem(title: "multiple_shop", first: false, second: false, third: true),
                    SubscriptionFeatureItem(title: "data_transfer", first: false, second: false, third: true),
                    SubscriptionFeatureItem(title: "receipt_print", first: false, second: true, third: true),
                    SubscriptionFeatureItem(title: "web_access", first: false, second: true, third: true),
                    SubscriptionFeatureItem(title: "hrm_management", first: false, second: false, third: true),
                    SubscriptionFeatureItem(title: "manage_user", first: false, second: false, third: true),
                    SubscriptionFeatureItem(title: "add_user", first: false, second: false, third: true),
                    SubscriptionFeatureItem(title: "multiple_device", first: false, second: true, third: true),
                    SubscriptionFeatureItem(title: "stock_limit", first: false, second: true, third: true),
                    SubscriptionFeatureItem(title: "storage", first: false, second: true, third: true),
                  ])),

                Positioned(right: 7, child: UnicornOutlineButton(
                  strokeWidth: 2,
                  radius: 10,
                  gradient: LinearGradient(colors: [systemPrimaryColor(), Colors.red],
                    begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  onPressed: () {  },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    width: 120, height: 740))),

                Positioned(right: 22, top: -15, child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(5)),
                  width: 90, height: 35,
                  child: Center(child: Text("popular".tr, style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge))),
                ))
              ],
            )
          ],): const SizedBox();
        }
    );
  }
}
