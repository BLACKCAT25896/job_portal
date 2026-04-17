import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_model.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';

class PostCommentItemWidget extends StatelessWidget {
  final PostCommentItem? postCommentItem;
  final int index;
  const PostCommentItemWidget({super.key,  required this.index, this.postCommentItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: postCommentItem?.comment??'')),

    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${postCommentItem?.comment}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),

            ],
          )),
    );
    }
  }