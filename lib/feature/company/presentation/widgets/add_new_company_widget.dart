import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/company/controller/company_controller.dart';
import 'package:ecommerce/feature/company/domain/models/company_body.dart';
import 'package:ecommerce/feature/company/domain/models/company_model.dart';
import 'package:ecommerce/feature/companySize/controller/company_size_controller.dart';
import 'package:ecommerce/feature/companySize/presentation/widgets/select_company_size_widget.dart';
import 'package:ecommerce/feature/industries/controller/industry_controller.dart';
import 'package:ecommerce/feature/industries/presentation/widgets/select_industry_widget.dart';
import 'package:ecommerce/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:ecommerce/feature/ownership_type/presentation/widgets/select_ownership_type_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCompanyWidget extends StatefulWidget {
  final CompanyItem? companyItem;
  const AddNewCompanyWidget({super.key, this.companyItem});

  @override
  State<AddNewCompanyWidget> createState() => _AddNewCompanyWidgetState();
}

class _AddNewCompanyWidgetState extends State<AddNewCompanyWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ceoController = TextEditingController();
  TextEditingController establishedInController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController uniqueIdController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.companyItem != null){
      update = true;
      nameController.text = widget.companyItem?.name??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyController>(builder: (companyController) {
      return Column(mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.paddingSizeDefault, children: [

          ResponsiveMasonryGrid(children: [
            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),

            CustomTextField(
              controller: ceoController,
              hintText: "ceo".tr,
              title: "ceo".tr,
            ),

            SelectIndustryWidget(),
            SelectOwnershipTypeWidget(),
            SelectCompanySizeWidget(),

            CustomTextField(
              controller: establishedInController,
              hintText: "established_in".tr,
              title: "established_in".tr,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.numberFormat],
            ),
            CustomTextField(controller: detailsController,
              hintText: "details".tr,
              title: "details".tr,),
            CustomTextField(controller: websiteController,
              hintText: "website".tr,
              title: "website".tr,),
            CustomTextField(controller: locationController,
              hintText: "location".tr,
              title: "location".tr,),
            CustomTextField(controller: uniqueIdController,
              hintText: "unique_id".tr,
              title: "unique_id".tr,),
          ]),



          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: companyController.isLoading? const CircularProgressIndicator() :
                CustomButton(onTap: (){
                  String name = nameController.text.trim();
                  String ceo = ceoController.text.trim();
                  String establishedIn = establishedInController.text.trim();
                  String details = detailsController.text.trim();
                  String website = websiteController.text.trim();
                  String location = locationController.text.trim();
                  String uniqueId = uniqueIdController.text.trim();
                  int? industryId = Get.find<IndustryController>().selectedIndustryItem?.id;
                  int? ownershipTypeId = Get.find<OwnershipTypeController>().selectedOwnershipTypeItem?.id;
                  int? companySizeId = Get.find<CompanySizeController>().selectedCompanySizeItem?.id;

                  if(name.isEmpty){
                    showCustomSnackBar("name_is_empty".tr);
                  }else if(ceo.isEmpty){
                    showCustomSnackBar("ceo_is_empty".tr);
                  }else if(establishedIn.isEmpty){
                    showCustomSnackBar("max_size_is_empty".tr);
                  }else if(details.isEmpty){
                    showCustomSnackBar("details_is_empty".tr);
                  }else if(website.isEmpty){
                    showCustomSnackBar("website_is_empty".tr);
                  }else if(location.isEmpty){
                    showCustomSnackBar("location_is_empty".tr);
                  }else if(uniqueId.isEmpty){
                    showCustomSnackBar("unique_id_is_empty".tr);
                  }else if(industryId == null){
                    showCustomSnackBar("select_industry".tr);
                  }else if(ownershipTypeId == null){
                    showCustomSnackBar("select_ownership_type".tr);
                  }else if(companySizeId == null){
                    showCustomSnackBar("select_company_size".tr);
                  }
                  else{
                    CompanyBody companyBody = CompanyBody(
                        name: name,
                        slug: name.toLowerCase().replaceAll(" ", "-"),
                        ceo: ceo,
                        establishedIn: int.parse(establishedIn),
                        details: details,
                        website: website,
                        location: location,
                        uniqueId: uniqueId,
                        industryId: industryId,
                        ownerShipTypeId: ownershipTypeId,
                        isFeatured: 0,
                        status: 1,
                        companySizeId: companySizeId,
                        sMethod: update? "put":"POST");
                    if(update){
                      companyController.updateCompany(companyBody, widget.companyItem!.id!);
                    }else{
                      companyController.createNewCompany(companyBody);
                    }
                  }
                }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
