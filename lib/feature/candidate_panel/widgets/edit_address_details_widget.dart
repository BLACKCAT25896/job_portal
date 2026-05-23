import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/dimensions.dart';

class EditAddressDetailsWidget extends StatefulWidget {
  const EditAddressDetailsWidget({super.key});

  @override
  State<EditAddressDetailsWidget> createState() => _EditAddressDetailsWidgetState();
}

class _EditAddressDetailsWidgetState extends State<EditAddressDetailsWidget> {

  TextEditingController presentAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();


  @override
  void initState() {
    super.initState();
    presentAddressController.text = Get.find<ProfileController>().profileModel?.data?.candidateInfo?.presentAddress ?? "";
    permanentAddressController.text = Get.find<ProfileController>().profileModel?.data?.candidateInfo?.permanentAddress ?? "";
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(controller: presentAddressController,
              title: "present_address".tr,
              hintText: "present_address".tr,
              maxLines: 4,
              minLines: 2,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
            ),
            CustomTextField(controller: permanentAddressController,
              title: "permanent_address".tr,
              hintText: "permanent_address".tr,
              maxLines: 4,
              minLines: 2,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
            ),

            controller.isLoading ? Center(child: CircularProgressIndicator()) :
            CustomButton(onTap: (){
              String presentAddress = presentAddressController.text;
              String permanentAddress = permanentAddressController.text;
              if(presentAddress.isEmpty){
                showCustomSnackBar("present_address".tr);
              }else if(permanentAddress.isEmpty){
                showCustomSnackBar("permanent_address".tr);
              }else{
                Get.find<ProfileController>().updateCandidateProfile(CandidateInfo(
                  presentAddress: presentAddress,
                  permanentAddress: permanentAddress
                ));
              }
            }, text: "confirm".tr)

          ],
        );
      }
    );
  }
}
