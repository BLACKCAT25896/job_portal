import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/post/controller/post_controller.dart';
import 'package:mighty_job/feature/post/domain/models/post_body.dart';
import 'package:mighty_job/feature/post/domain/models/post_model.dart';
import 'package:mighty_job/feature/post_category/controller/post_category_controller.dart';
import 'package:mighty_job/feature/post_category/domain/repository/post_category_repository.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/select_post_category_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPostWidget extends StatefulWidget {
  final PostItem? postItem;
  const AddNewPostWidget({super.key, this.postItem});

  @override
  State<AddNewPostWidget> createState() => _AddNewPostWidgetState();
}

class _AddNewPostWidgetState extends State<AddNewPostWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.postItem != null){
      update = true;
      nameController.text = widget.postItem?.title??'';
      descriptionController.text = widget.postItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (postController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),
            SelectPostCategoryWidget(),


            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                children: [

                  Text("default".tr, style: textRegular),
                  ActiveInActiveWidget(active: postController.isDefault,
                    onChanged: (val){
                    postController.toggleIsFeatured();
                    },),
                ]),
            ]),
          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: postController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();
              int? categoryId = Get.find<PostCategoryController>().selectedPostCategoryItem?.id;


              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }else if(categoryId == null){
                showCustomSnackBar("select_category".tr);
              }
              else{
                PostBody postBody = PostBody(
                    title: name,
                    description: description,
                    slug: name.toLowerCase().replaceAll(" ", "-"),
                    metaTitle: name,
                    metaDescription: description,
                    postCategoryId: categoryId,
                    sMethod: update? "put":"POST",
                    status: true);
                if(update){
                  postController.updatePost(postBody, widget.postItem!.id!);
                }else{
                  postController.createNewPost(postBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
