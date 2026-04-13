import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_rich_text_editor_widget/custom_richtext_editor_widget.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/domain/model/policy_model.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewPageWidget extends StatefulWidget {
  final PagesItem? pageItem;
  const CreateNewPageWidget({super.key, this.pageItem});

  @override
  State<CreateNewPageWidget> createState() => _CreateNewPageWidgetState();
}

class _CreateNewPageWidgetState extends State<CreateNewPageWidget> {
  HtmlEditorController descriptionController = HtmlEditorController();
  TextEditingController typeController = TextEditingController();
  @override
  void initState() {
    if(widget.pageItem != null) {
      typeController.text = widget.pageItem?.type??'New';
      WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      descriptionController.setText(widget.pageItem?.description??'');
    });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(
      builder: (pagesController) {
        return Column(spacing: Dimensions.paddingSizeDefault,mainAxisSize: MainAxisSize.min, children: [
         CustomTextField(hintText: "page_type".tr, controller: typeController,title: "page_type".tr),
          CustomRichEditor(key: UniqueKey(), controller: descriptionController,
              height: Get.height - 390),

          Align(alignment : Alignment.centerRight, child: SizedBox(width: 150,
            child: pagesController.isLoading?
                Center(child: CircularProgressIndicator()):
            CustomButton(onTap: () async {
              String descriptionText = await descriptionController.getText();
              String type = typeController.text.trim();

              if(type.isEmpty){
                showCustomSnackBar("page_type_is_empty".tr);
              }else if(descriptionText.isEmpty){
                showCustomSnackBar("description_is_empty".tr);
              }else {
                if(widget.pageItem != null) {
                  pagesController.editPages(widget.pageItem!.id!, type, descriptionText);
                }else{
                  pagesController.addNewPage(type, descriptionText);
                }
              }
            }, text: widget.pageItem != null? "update".tr :"save".tr),
          ))
        ]);
      }
    );
  }
}
