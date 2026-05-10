import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/domain/models/post_a_job_body.dart';
import 'package:job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAJobWidget extends StatefulWidget {
  final JobListingItem? listingItem;
  const PostAJobWidget({super.key, this.listingItem});

  @override
  State<PostAJobWidget> createState() => _PostAJobWidgetState();
}

class _PostAJobWidgetState extends State<PostAJobWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.listingItem != null){
      update = true;
      nameController.text = widget.listingItem?.jobTitle??'';
      descriptionController.text = widget.listingItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(builder: (listingController) {
      return CustomContainer(borderRadius: 5,
        child: Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

              CustomTextField(title: "name".tr,
                controller: nameController,
                hintText: "enter_name".tr,),



            ],),
            ),

          ]),

          Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: listingController.isLoading? const CircularProgressIndicator() :

              CustomButton(onTap: (){
                String name = nameController.text.trim();
                String description = descriptionController.text.trim();

                if(name.isEmpty){
                  showCustomSnackBar("name_is_empty".tr);
                }
                else{
                  PostAJobBody listingBody = PostAJobBody(

                      description: description,
                      sMethod: update? "put":"POST",
                      status: true);
                  if(update){
                    listingController.updateJobListing(listingBody, widget.listingItem!.id!);
                  }else{
                    listingController.createNewJobListing(listingBody);
                  }
                }
                }, text:  "confirm".tr))
            ],),
      );
        }
    );
  }
}
