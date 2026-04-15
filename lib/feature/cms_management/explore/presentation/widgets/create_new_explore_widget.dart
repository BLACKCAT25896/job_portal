import 'package:mighty_job/common/widget/image_picker_widget.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/cms_management/explore/domain/model/explore_model.dart';
import 'package:mighty_job/feature/cms_management/explore/logic/explore_controller.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewExploreWidget extends StatefulWidget {
  final ExploreItem? exploreItem;
  const CreateNewExploreWidget({super.key, this.exploreItem});

  @override
  State<CreateNewExploreWidget> createState() => _CreateNewExploreWidgetState();
}

class _CreateNewExploreWidgetState extends State<CreateNewExploreWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    if(widget.exploreItem != null) {
      titleController.text = widget.exploreItem?.title??'';
      descriptionController.text = widget.exploreItem?.description??'';

    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      builder: (benefitController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          CustomTextField(title: "title".tr, hintText: "title".tr, controller: titleController, maxLength: 100),
          CustomTextField(title: "description".tr, minLines: 3, maxLines: 5, inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
              hintText: "description".tr, controller: descriptionController, maxLength: 255),

           ImagePickerWidget(onImagePicked: ()=> benefitController.pickImage(),
           pickedFile: benefitController.benefitImage,
           imageUrl: "${AppConstants.imageBaseUrl}/explores/${widget.exploreItem?.image}",),

          SizedBox(height: Dimensions.paddingSizeLarge),
          benefitController.loading? const Center(child: CircularProgressIndicator()) :
          CustomButton(
            onTap: () {
              String title = titleController.text.trim();
              String description = descriptionController.text.trim();

              if(widget.exploreItem != null){
                benefitController.editExplore(title, description, widget.exploreItem!.id!);
              }else {
                benefitController.createExplore(title, description);
              }

            },
            text: widget.exploreItem != null?"update".tr : "add".tr,
          ),
        ]);
      }
    );
  }
}