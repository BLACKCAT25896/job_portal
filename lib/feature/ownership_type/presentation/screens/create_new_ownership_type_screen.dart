
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/layout/section_header_with_path_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:ecommerce/feature/ownership_type/presentation/widgets/add_new_ownership_type_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewOwnershipTypeScreen extends StatefulWidget {
  final OwnershipTypeItem? ownershipTypeItem;
  const CreateNewOwnershipTypeScreen({super.key, this.ownershipTypeItem});

  @override
  State<CreateNewOwnershipTypeScreen> createState() => _CreateNewOwnershipTypeScreenState();
}

class _CreateNewOwnershipTypeScreenState extends State<CreateNewOwnershipTypeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "ownership_type".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            SectionHeaderWithPath(sectionTitle: "ownership_type".tr,
              pathItems: ["add_new_ownership_type".tr]),
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: AddNewOwnershipTypeWidget(ownershipTypeItem: widget.ownershipTypeItem),
            ),
          ],
        ))
      ],),
    );
  }
}
