import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/post_comment/controller/post_comment_controller.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_body.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPostCommentWidget extends StatefulWidget {
  final PostCommentItem? postCommentItem;
  const AddNewPostCommentWidget({super.key, this.postCommentItem});

  @override
  State<AddNewPostCommentWidget> createState() => _AddNewPostCommentWidgetState();
}

class _AddNewPostCommentWidgetState extends State<AddNewPostCommentWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.postCommentItem != null){
      update = true;
      nameController.text = widget.postCommentItem?.comment??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostCommentController>(builder: (postCommentController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),


            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Row(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeExtraSmall,
                children: [

                  Text("default".tr, style: textRegular),
                  ActiveInActiveWidget(active: postCommentController.isDefault,
                    onChanged: (val){
                    postCommentController.toggleIsFeatured();
                    },),
                ]),
            ]),
          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: postCommentController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();


              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                PostCommentBody postCommentBody = PostCommentBody();
                if(update){
                  postCommentController.updatePostComment(postCommentBody, widget.postCommentItem!.id!);
                }else{
                  postCommentController.createNewPostComment(postCommentBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
