import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/feature/authentication/presentation/widgets/candidate_registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
        child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
            child: Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeExtraLarge),
              child: CandidateRegistrationWidget()))));
  }
}
