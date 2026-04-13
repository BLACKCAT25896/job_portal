import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/create_new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewUserScreen extends StatefulWidget {
  final UserItem? userItem;
  const CreateNewUserScreen({super.key, this.userItem});

  @override
  State<CreateNewUserScreen> createState() => _CreateNewUserScreenState();
}

class _CreateNewUserScreenState extends State<CreateNewUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "user".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(child: CreateNewUserWidget(userItem: widget.userItem))
        ]));
  }
}
