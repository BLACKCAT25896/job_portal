import 'package:job/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:job/feature/authentication/presentation/widgets/company_registration_widget.dart';
import 'package:job/util/dimensions.dart';


class CreateNewCompanyAccount extends StatefulWidget {
  final String type;
  const CreateNewCompanyAccount({super.key, this.type = "create"});

  @override
  State<CreateNewCompanyAccount> createState() => _CreateNewCompanyAccountState();
}

class _CreateNewCompanyAccountState extends State<CreateNewCompanyAccount> {
  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
        child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
            child: Padding(padding: EdgeInsets.only(top: Dimensions.paddingSizeExtraLarge),
              child: CompanyRegistrationWidget(type: widget.type)))));
  }
}
