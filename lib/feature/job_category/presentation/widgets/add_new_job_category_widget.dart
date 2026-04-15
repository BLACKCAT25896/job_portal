import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/job_category/controller/job_category_controller.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_body.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewJobCategoryWidget extends StatefulWidget {
  final JobCategoryItem? categoryItem;
  const AddNewJobCategoryWidget({super.key, this.categoryItem});

  @override
  State<AddNewJobCategoryWidget> createState() => _AddNewJobCategoryWidgetState();
}

class _AddNewJobCategoryWidgetState extends State<AddNewJobCategoryWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    final categoryController = Get.find<JobCategoryController>();
    if(widget.categoryItem != null){
      update = true;
      nameController.text = widget.categoryItem?.name??'';
      descriptionController.text = widget.categoryItem?.description??'';
      categoryController.isFeatured = widget.categoryItem?.isFeatured == 1;

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobCategoryController>(builder: (categoryController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),


            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                children: [

                  Text("featured".tr, style: textRegular),
                  ActiveInActiveWidget(active: categoryController.isFeatured,
                    onChanged: (val){
                    categoryController.toggleIsFeatured();
                    },),
                ]),
            ]),
          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: categoryController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                JobCategoryBody categoryBody = JobCategoryBody(
                    name: name,
                    description: description,
                    sMethod: update? "put":"POST",
                    status: true,
                    isFeatured: false);
                if(update){
                  categoryController.updateJobCategory(categoryBody, widget.categoryItem!.id!);
                }else{
                  categoryController.createNewJobCategory(categoryBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
