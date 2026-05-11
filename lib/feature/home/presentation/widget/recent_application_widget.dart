import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class RecentApplicationWidget extends StatelessWidget {
  const RecentApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
        final recentApplications = controller.dashboardReportModel?.data?.recentApplications ?? [];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Text('recent_applications'.tr,
                      style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),

                  const SizedBox(height: 2),

                  Text('latest_five_submissions'.tr,
                    style: textRegular.copyWith(color: Theme.of(context).hintColor)),
                ]),

                TextButton(onPressed: () {},
                  child: Text('View All →', style: textRegular.copyWith())),
                  ],
                ),

                const SizedBox(height: 20),


                Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(children: [
                    Expanded(flex: 4, child: Text('CANDIDATE',
                          style: textRegular.copyWith(color: Theme.of(context).hintColor))),

                      Expanded(flex: 3, child: Text(
                        'DATE', style:textRegular.copyWith(color: Theme.of(context).hintColor))),

                      Expanded(flex: 3, child: Text('STATUS',
                          style: textRegular.copyWith(color: Theme.of(context).hintColor))),

                      SizedBox(width: 30),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                CustomDivider(),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentApplications.length,
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = recentApplications[index];

                    final name = item.candidate ?? '';
                    final status = item.status ?? '';
                    final date = item.date ?? '';

                    final statusColor = _getStatusColor(status);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                      child: Row(children: [


                        Expanded(flex: 4, child: Row(children: [
                          CustomContainer(width: 36,borderRadius: 123, height: 36,
                            color: statusColor.withValues(alpha: 0.12),
                            child: Center(
                              child: Text(name.isNotEmpty ? name[0].toUpperCase() : 'C',
                                      style: textSemiBold.copyWith(color: statusColor)))),

                          const SizedBox(width: 12),

                          Expanded(child: Text(name, style: textRegular.copyWith(),
                            overflow: TextOverflow.ellipsis)),
                        ])),


                        Expanded(flex: 3, child: Text(date,
                            style: textRegular.copyWith(color: Theme.of(context).hintColor))),


                          Expanded(flex: 3, child: CustomContainer(showShadow: false,
                            color: statusColor.withValues(alpha: 0.12),

                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              CustomContainer(showShadow: false,
                                color: statusColor, width: 6, height: 6,borderRadius: 123,),

                              const SizedBox(width: 6),

                              Flexible(child: Text(status.tr, overflow: TextOverflow.ellipsis,
                                style: textRegular.copyWith(color: statusColor))),
                            ]))),

                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'interview':
        return const Color(0xFF8B5CF6);

      case 'applied':
        return const Color(0xFF4F46E5);

      case 'rejected':
        return const Color(0xFFEF4444);

      case 'hired':
        return const Color(0xFF10B981);

      default:
        return const Color(0xFF6B7280);
    }
  }
}