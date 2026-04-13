import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 120, height: 120,
      child: CustomContainer(
        child: SpinKitCircle(color: systemPrimaryColor(), size: 40.0,),),
    ));
  }
}
