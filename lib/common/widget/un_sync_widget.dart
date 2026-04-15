import 'package:mighty_job/common/controller/network_controller.dart';
        import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
        import 'package:mighty_job/util/styles.dart';
        import 'package:flutter/material.dart';
        import 'package:get/get.dart';

        class UnSynced extends StatelessWidget {
          final int unSyncedCount;
          final Function()? onTap;
          const  UnSynced ({super.key, required this.unSyncedCount, this.onTap});

          @override
          Widget build(BuildContext context) {
            return FutureBuilder<bool>(
              future: Get.find<NetworkController>().isInternetAvailable(),
              builder: (context, snapshot) {
                return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomContainer(verticalPadding: 0, borderRadius: 5,
                    child: Row(children: [
                        Row(children: [
                            Icon(Icons.warning_amber, color: Colors.red, size: 15),
                            SizedBox(width: 8),
                            Text("$unSyncedCount ${"un_sync".tr}",
                                style: textRegular.copyWith(color: Colors.red)),
                          ]),
                        if (snapshot.connectionState == ConnectionState.done && snapshot.data == true)
                          IconButton(onPressed: onTap, icon: Icon(Icons.sync,
                              color: systemPrimaryColor())),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }