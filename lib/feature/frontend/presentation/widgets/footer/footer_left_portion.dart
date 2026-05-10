import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job/common/global_widget/header_logo_section.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';

class FooterLeftPortion extends StatelessWidget {
  const FooterLeftPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: ResponsiveHelper.isDesktop(context)? CrossAxisAlignment.start : CrossAxisAlignment.center, children: [
          const FooterLogoSection(),

           SizedBox(height: ResponsiveHelper.isDesktop(context)? 40: Dimensions.paddingSizeDefault),
           Row(spacing: Dimensions.paddingSizeDefault,
             mainAxisAlignment: ResponsiveHelper.isDesktop(context)? MainAxisAlignment.start: MainAxisAlignment.center, children: const [
               FaIcon(FontAwesomeIcons.facebook,  size: 20),
               FaIcon(FontAwesomeIcons.twitter, size: 20),
               FaIcon(FontAwesomeIcons.linkedin,    size: 20),
          ],
          ),
          SizedBox(height: Dimensions.paddingSizeDefault,),

        ],
      ),
    );
  }
}
