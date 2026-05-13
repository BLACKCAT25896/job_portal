import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("gender".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),),
            SizedBox(height: 40,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index){
                  GenderModel gender = controller.genderList[index];
                  bool isSelected = gender.isSelected ?? false;
                return CustomContainer(color: isSelected? systemPrimaryColor() : null,
                    verticalPadding: 0, borderRadius : 5, showShadow: false,
                    border: Border.all(color: systemPrimaryColor(), width: .5),
                    onTap: (){
                  controller.setSelectedRoleIndex(index);
                },

                    child: Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                      Icon(gender.icon, color:isSelected? Colors.white: systemPrimaryColor(),),
                      Text(gender.name, style: textRegular.copyWith(color:
                          isSelected? Colors.white: systemPrimaryColor(),
                          fontSize: Dimensions.fontSizeSmall)),
                    ]));
              }, separatorBuilder: (_, index){
                  return SizedBox(width: Dimensions.paddingSizeSmall);
              }, itemCount: controller.genderList.length),
            ),
          ],
        );
      }
    );
  }
}

class GenderModel {
  final String name;
  final IconData icon;
  bool? isSelected;

  GenderModel({required this.name, required this.icon, this.isSelected});
}

