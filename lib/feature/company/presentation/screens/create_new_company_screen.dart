
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/company/domain/models/company_model.dart';
import 'package:mighty_job/feature/company/presentation/widgets/add_new_company_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewCompanyScreen extends StatefulWidget {
  final CompanyItem? companyItem;
  const CreateNewCompanyScreen({super.key, this.companyItem});

  @override
  State<CreateNewCompanyScreen> createState() => _CreateNewCompanyScreenState();
}

class _CreateNewCompanyScreenState extends State<CreateNewCompanyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "company".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "company".tr,
              pathItems: ["add_new_company".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewCompanyWidget(companyItem: widget.companyItem),
            ),
          ],
        ))
      ],),
    );
  }
}
