
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_ratting_bar_builder.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/cms_management/feedback/domain/model/feedback_body.dart';
import 'package:ecommerce/feature/cms_management/feedback/domain/model/feedback_model.dart';
import 'package:ecommerce/feature/cms_management/feedback/logic/feedback_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewFeedbackWidget extends StatefulWidget {
  final FeedbackItem? feedbackItem;
  const CreateNewFeedbackWidget({super.key, this.feedbackItem});

  @override
  State<CreateNewFeedbackWidget> createState() => _CreateNewFeedbackWidgetState();
}

class _CreateNewFeedbackWidgetState extends State<CreateNewFeedbackWidget> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int rating = 0;


  @override
  void initState() {
    if(widget.feedbackItem != null) {
      descriptionController.text = widget.feedbackItem?.description??'';
      nameController.text = widget.feedbackItem?.name??'';


    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      builder: (feedbackController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [

          ImagePickerWidget(onImagePicked: ()=> feedbackController.pickImage(),
              imageUrl: "${AppConstants.imageBaseUrl}/testimonials/${widget.feedbackItem?.thumbnailImage}",
          pickedFile: feedbackController.thumbnail),

          CustomTextField(title: "name".tr, inputType: TextInputType.name,
              hintText: "name".tr, controller: nameController),


          CustomTextField(title: "description".tr, minLines: 3, maxLines: 5, inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              hintText: "description".tr, controller: descriptionController, maxLength: 500),

          SizedBox(height: Dimensions.paddingSizeDefault),
          Text("rating".tr, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          CustomRatingBar(rating: rating,
            onRatingChanged: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
          ),


          SizedBox(height: Dimensions.paddingSizeLarge),
          feedbackController.loading? const Center(child: CircularProgressIndicator()) :
          CustomButton(
            onTap: () {
              String star = rating.toString();
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();


              FeedbackBody body = FeedbackBody(
                name: name,
                description: description,
                rating: star,
                sMethod: widget.feedbackItem != null? "PUT" :"POST",);
              if(widget.feedbackItem != null){
                feedbackController.editFeedback(body, widget.feedbackItem!.id!);
              }else {
                feedbackController.createFeedback(body);
              }

            },
            text: widget.feedbackItem != null?"update".tr : "add".tr,
          ),
        ]);
      }
    );
  }
}