
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/add_new_salary_currency_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewSalaryCurrencyScreen extends StatefulWidget {
  final SalaryCurrencyItem? salaryCurrencyItem;
  const CreateNewSalaryCurrencyScreen({super.key, this.salaryCurrencyItem});

  @override
  State<CreateNewSalaryCurrencyScreen> createState() => _CreateNewSalaryCurrencyScreenState();
}

class _CreateNewSalaryCurrencyScreenState extends State<CreateNewSalaryCurrencyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "salary_currency".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "salary_currency".tr,
              pathItems: ["add_new_salary_currency".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewSalaryCurrencyWidget(salaryCurrencyItem: widget.salaryCurrencyItem),
            ),
          ],
        ))
      ],),
    );
  }
}
