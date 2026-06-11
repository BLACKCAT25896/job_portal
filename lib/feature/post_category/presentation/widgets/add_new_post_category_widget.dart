import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/post_category/controller/post_category_controller.dart';
import 'package:job/feature/post_category/domain/models/post_category_body.dart';
import 'package:job/feature/post_category/domain/models/post_category_model.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPostCategoryWidget extends StatefulWidget {
  final PostCategoryItem? postCategoryItem;
  const AddNewPostCategoryWidget({super.key, this.postCategoryItem});

  @override
  State<AddNewPostCategoryWidget> createState() => _AddNewPostCategoryWidgetState();
}

class _AddNewPostCategoryWidgetState extends State<AddNewPostCategoryWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.postCategoryItem != null){
      update = true;
      nameController.text = widget.postCategoryItem?.name??'';
      descriptionController.text = widget.postCategoryItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostCategoryController>(builder: (postCategoryController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        CustomTextField(title: "name".tr,
          controller: nameController,
          hintText: "name".tr,),

        CustomTextField(
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline,
          title: "description".tr,
          controller: descriptionController,
          hintText: "description".tr,),

        Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: postCategoryController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                PostCategoryBody postCategoryBody = PostCategoryBody(
                    name: name,
                    slug: name.toLowerCase().replaceAll(" ", "-"),
                    isDefault: postCategoryController.isDefault,
                    description: description,
                    sMethod: update? "put":"POST",
                    status: true);
                if(update){
                  postCategoryController.updatePostCategory(postCategoryBody, widget.postCategoryItem!.id!);
                }else{
                  postCategoryController.createNewPostCategory(postCategoryBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
