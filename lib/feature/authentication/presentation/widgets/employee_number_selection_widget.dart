import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class EmployeeNumberSelectionWidget extends StatelessWidget {
  const EmployeeNumberSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("number_of_employees".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),),
            SizedBox(height: 34,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index){
                  final numberOfEmployee = controller.numberOfEmployees[index];
                  bool isSelected = numberOfEmployee == controller.selectedNumberOfEmployees;
                return CustomContainer(color: isSelected? systemPrimaryColor() : null,
                    verticalPadding: 0, borderRadius : 5, showShadow: false,
                    horizontalPadding: Dimensions.paddingSizeLarge,
                    border: Border.all(color: systemPrimaryColor(), width: .5),
                    onTap: (){
                  controller.setSelectedNumberOfEmployees(numberOfEmployee);
                },
                    child: Center(
                      child: Text(numberOfEmployee, style: textRegular.copyWith(color:
                          isSelected? Colors.white: systemPrimaryColor(),
                          fontSize: Dimensions.fontSizeLarge)),
                    ));
              }, separatorBuilder: (_, index){
                  return SizedBox(width: Dimensions.paddingSizeSmall);
              }, itemCount: controller.numberOfEmployees.length),
            ),
          ],
        );
      }
    );
  }
}


