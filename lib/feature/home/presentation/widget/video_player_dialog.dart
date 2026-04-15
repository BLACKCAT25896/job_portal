import 'dart:convert'; // For UTF-8 encoding
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mighty_job/util/dimensions.dart';

class VideoPlayerDialog extends StatefulWidget {
  final String? url;
  const VideoPlayerDialog({super.key, required this.url});

  @override
  VideoPlayerDialogState createState() => VideoPlayerDialogState();
}

class VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    log("url is ${widget.url}");
    if (widget.url != null && widget.url!.isNotEmpty) {
      // Construct the HTML content for the iframe
      String htmlContent = '''
        <html>
          <body style="margin:0;padding:0;overflow:hidden;">
            <iframe width="100%" height="100%" src="${widget.url}" 
            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen></iframe>
          </body>
        </html>
      ''';

      // Encode the HTML content
      String encodedHtml = Uri.dataFromString(htmlContent, mimeType: 'text/html', encoding: utf8).toString();

      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(encodedHtml));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (widget.url == null || widget.url!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Dialog(
      child: Container(
        height: width / 1.55,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
