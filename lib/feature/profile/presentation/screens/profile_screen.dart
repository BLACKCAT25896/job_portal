import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/theme_controller.dart';
import 'package:mighty_job/common/widget/app_bar_widget.dart';
import 'package:mighty_job/common/widget/body_widget.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/sun_switch_widget.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: systemPrimaryColor(),
      body: BodyWidget(
        appBar: AppBarWidget(
          showBackButton: false,
          actionWidget: GetBuilder<ThemeController>(
            builder: (themeController) {
              return FancyDayNightSwitch(
                value: themeController.darkTheme,
                onChanged: (_) => themeController.toggleTheme(),
              );
            },
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            children: [
              _buildProfileHeader(),
              const SizedBox(height: Dimensions.paddingSizeDefault),

              ProfileSection(
                title: 'account'.tr,
                items: [
                  ProfileMenuItemWidget(icon: Images.profile, title: "profile_info".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "become_a_pro".tr),
                ],
              ),

              ProfileSection(
                title: 'preferences'.tr,
                items: [
                  ProfileMenuItemWidget(icon: Images.profile, title: "notification_settings".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "language".tr),
                ],
              ),

              ProfileSection(
                title: 'activity_and_records'.tr,
                items: [
                  ProfileMenuItemWidget(icon: Images.profile, title: "reported_question".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "history".tr),
                ],
              ),

              ProfileSection(
                title: 'extras'.tr,
                items: [
                  ProfileMenuItemWidget(icon: Images.profile, title: "gift".tr),
                ],
              ),

              ProfileSection(
                title: 'help_and_legal'.tr,
                items: [
                  ProfileMenuItemWidget(icon: Images.profile, title: "faq".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "about_us".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "privacy_policy".tr),
                  const MenuDivider(),
                  ProfileMenuItemWidget(icon: Images.profile, title: "terms_and_conditions".tr),
                ],
              ),

              CustomContainer(borderRadius: 5, showShadow: false, color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                child: Column(spacing: Dimensions.paddingSizeSmall, children: [
                    ProfileMenuItemWidget(icon: Images.profile, title: "delete_my_account".tr, color: Theme.of(context).colorScheme.error),
                    const MenuDivider(color: Colors.redAccent),
                    ProfileMenuItemWidget(icon: Images.profile, title: "log_out".tr, color: Theme.of(context).colorScheme.error),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CustomImage(width: 70, height: 70, radius: 234, image: ""),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Text("Mr John Doe", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
        Text("example@gmail.com", style: textRegular),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const ProfileSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
      child: CustomContainer(showShadow: false, color: Theme.of(context).hintColor.withValues(alpha: 0.05), verticalPadding: Dimensions.paddingSizeDefault,
        borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeExtraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            ...items,
          ],
        ),
      ),
    );
  }
}

class MenuDivider extends StatelessWidget {
  final Color? color;
  const MenuDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      height: 8,
      color: color ?? Theme.of(context).hintColor,
    );
  }
}
