import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_body.dart';
import 'package:job/feature/candidate_links/domain/models/candidate_link_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateLinkWidget extends StatefulWidget {
  final CandidateLinkItem? candidateLinkItem;
  const AddNewCandidateLinkWidget({super.key, this.candidateLinkItem});

  @override
  State<AddNewCandidateLinkWidget> createState() => _AddNewCandidateLinkWidgetState();
}

class _AddNewCandidateLinkWidgetState extends State<AddNewCandidateLinkWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateLinkItem != null) {
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateLinkController>(builder: (candidateLinkController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(controller: nameController,
              hintText: "platform".tr,
              title: "platform".tr,
              inputType: TextInputType.name),

          CustomTextField(controller: urlController,
              hintText: "url".tr,
              title: "url".tr),

        ]),


            candidateLinkController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){

                  String name = nameController.text.trim();
                  String url = urlController.text.trim();

                  if(name.isEmpty){
                    showCustomSnackBar("platform_is_required".tr);
                  }
                  else if(url.isEmpty){
                    showCustomSnackBar("url_is_required".tr);
                  }


                  else{
                    CandidateLinkBody body = CandidateLinkBody(
                      platform: name,
                      url: url,
                      status: 1,
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateLinkController.updateCandidateLink(body,
                          widget.candidateLinkItem!.id!);
                    }else{
                      candidateLinkController.createNewCandidateLink(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
