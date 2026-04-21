import 'package:flutter/material.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/copyright_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/footer_left_portion.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/footer_navigation_link_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/job_recruiter.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/job_seekers.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/footer/news_letter_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return isDesktop? Column(children: [
      Container(color: Theme.of(context).cardColor, padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: const Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: FooterLeftPortion()),
            Expanded(child: FooterNavigationLinkWidget()),
            Expanded(child: JobSeekers()),
            Expanded(child: JobRecruiter()),
            Expanded(child: NewsLetterWidget())

          ])))),
       Container(width: double.infinity,height: .25, color: Theme.of(context).hintColor),
      const CopyrightWidget()
      ],
    ):

    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveHelper.isDesktop(context)? 50 : Dimensions.paddingSizeDefault),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeOverLarge, children: [
              FooterLeftPortion(),
              FooterNavigationLinkWidget(),
              JobSeekers(),
              JobRecruiter(),
              NewsLetterWidget()

        ])),
      const CopyrightWidget()
    ],
    );
  }
}

