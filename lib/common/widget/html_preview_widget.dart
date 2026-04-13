import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:universal_html/html.dart' as html;

class HtmlViewer extends StatelessWidget {
  final String? htmlContent;
  const HtmlViewer({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {

    return htmlContent == '@' ? const SizedBox() : HtmlWidget(
      htmlContent ?? '',
      textStyle: textRegular.copyWith(
          color: Theme.of(context).textTheme.bodyLarge!.color),
      onTapUrl: (String url) {
        if(GetPlatform.isWeb) {
          html.window.open(url,'_blank');
          return true;
        }else {
          return launchUrlString(url, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
