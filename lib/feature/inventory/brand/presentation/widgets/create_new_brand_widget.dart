import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewBrandWidget extends StatefulWidget {
  final BrandItem? brandItem;
  const CreateNewBrandWidget({super.key, this.brandItem});

  @override
  State<CreateNewBrandWidget> createState() => _CreateNewBrandWidgetState();
}

class _CreateNewBrandWidgetState extends State<CreateNewBrandWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.brandItem != null) {
      update = true;
      nameController.text = widget.brandItem?.name??'';
      descriptionController.text = widget.brandItem?.description??'';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<BrandController>(builder: (brandController) {
      return Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(
              child: Column(spacing: Dimensions.paddingSizeDefault, children: [
                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),

                CustomTextField(title: "description".tr,
                  controller: descriptionController,
                  hintText: "enter_description".tr,),


              ],)),
            if(isDesktop)
              CustomContainer(showShadow: false,borderRadius: 0,
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 200, horizontalPadding: Dimensions.paddingSizeDefault,
                child: ImagePickerWidget(onImagePicked: () => brandController.pickImage(),
                  pickedFile: brandController.thumbnail,
                  guide: "thumbnail_image_guide".tr,
                  imageUrl: "${AppConstants.imageBaseUrl}/brands/${widget.brandItem?.imageUrl}",
                  title: "image".tr,
                ),
              ),
          ]),
              if(!isDesktop)
              ImagePickerWidget(onImagePicked: () => brandController.pickImage(),
                pickedFile: brandController.thumbnail,
                imageUrl: "${AppConstants.imageBaseUrl}/brands/${widget.brandItem?.imageUrl}",
                title: "image".tr,
                guide: "thumbnail_image_guide".tr,
              ),


              Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                  child: brandController.isLoading? const Center(child: CircularProgressIndicator(),):
                  CustomButton(onTap: (){
                    String name = nameController.text.trim();
                    String description = descriptionController.text.trim();
                    if(name.isEmpty){
                      showCustomSnackBar("name_is_empty".tr);
                    }
                    else{
                      if(update){
                        brandController.updateBrand(name, description, widget.brandItem!.id!);
                      }else{
                        brandController.createNewBrand(name, description);
                      }

                    }

                  }, text: "confirm".tr))
            ],),
          );
        }
    );
  }
}
