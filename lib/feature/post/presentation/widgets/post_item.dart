import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/edit_delete_popup_widget.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/post/controller/post_controller.dart';
import 'package:job/feature/post/presentation/widgets/add_new_post_widget.dart';
import 'package:job/feature/post/domain/models/post_model.dart';
import 'package:job/feature/post/presentation/screens/create_new_post_screen.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostItemWidget extends StatelessWidget {
  final PostItem? postItem;
  final int index;
  const PostItemWidget({super.key,  required this.index, this.postItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: postItem?.title??'')),
      Expanded(child: CustomTextItemWidget(text: postItem?.category?.name??'')),
      Expanded(child: CustomTextItemWidget(text: postItem?.description??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewPostWidget(postItem: postItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "post", onTap: (){
              Get.back();
              Get.find<PostController>().deletePost(postItem!.id!);
              },));

          })
    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${postItem?.title}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewPostScreen(postItem: postItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "post", onTap: (){
                      Get.back();
                      Get.find<PostController>().deletePost(postItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }