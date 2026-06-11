import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/edit_delete_popup_widget.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/company/controller/company_controller.dart';
import 'package:job/feature/company/domain/models/company_model.dart';
import 'package:job/feature/company/presentation/screens/create_new_company_screen.dart';
import 'package:job/feature/company/presentation/widgets/add_new_company_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyItemWidget extends StatelessWidget {
  final CompanyItem? companyItem;
  final int index;
  const CompanyItemWidget({super.key,  required this.index, this.companyItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      CustomImage(width: 50,height: 50, image: "${AppConstants.imageBaseUrl}/companies/${companyItem?.logo}"),
      Expanded(child: CustomTextItemWidget(text: companyItem?.name??'-')),
      Expanded(child: CustomTextItemWidget(text: companyItem?.website??'-')),
      Expanded(child: CustomTextItemWidget(text: companyItem?.details??'-')),
      Expanded(child: CustomTextItemWidget(text: companyItem?.establishedIn??'-')),
      Expanded(child: CustomTextItemWidget(text: companyItem?.openJobs.toString()??'-')),


      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(title: "company".tr,
            child: AddNewCompanyWidget(companyItem: companyItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "company".tr, onTap: (){
              Get.back();
              Get.find<CompanyController>().deleteCompany(companyItem!.id!);
              },));

          })
    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


            SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${companyItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${companyItem?.website}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${companyItem?.details}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${companyItem?.establishedIn}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${companyItem?.openJobs}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                ],
              )),

              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewCompanyScreen(companyItem: companyItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "company", onTap: (){
                      Get.back();
                      Get.find<CompanyController>().deleteCompany(companyItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }