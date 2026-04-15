import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_body.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewJobListingWidget extends StatefulWidget {
  final JobListingItem? listingItem;
  const AddNewJobListingWidget({super.key, this.listingItem});

  @override
  State<AddNewJobListingWidget> createState() => _AddNewJobListingWidgetState();
}

class _AddNewJobListingWidgetState extends State<AddNewJobListingWidget> {
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
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),



          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: listingController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                JobListingBody listingBody = JobListingBody(

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
          ],);
        }
    );
  }
}
