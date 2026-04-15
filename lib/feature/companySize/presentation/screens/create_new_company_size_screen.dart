
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/companySize/domain/models/company_size_model.dart';
import 'package:mighty_job/feature/companySize/presentation/widgets/add_new_company_size_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewCompanySizeScreen extends StatefulWidget {
  final CompanySizeItem? companySizeItem;
  const CreateNewCompanySizeScreen({super.key, this.companySizeItem});

  @override
  State<CreateNewCompanySizeScreen> createState() => _CreateNewCompanySizeScreenState();
}

class _CreateNewCompanySizeScreenState extends State<CreateNewCompanySizeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "company_size".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "company_size".tr,
              pathItems: ["add_new_company_size".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewCompanySizeWidget(companySizeItem: widget.companySizeItem),
            ),
          ],
        ))
      ],),
    );
  }
}
