import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/helper/route_helper.dart';

import '../widgets/login_widget.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomContainer(
        child: Padding(padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.isDesktop(context)?24: Dimensions.paddingSizeDefault),
          child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 320,
              maxHeight: 450),
            child: GetBuilder<AuthenticationController>(builder: (_) {
              return const LoginWidget();
            }),
          ),
        ),
      ),
      ),
    );
  }
}
