import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'secure_pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class PdfViewerWidget extends StatefulWidget {
  final String? pdfUrl;
  const PdfViewerWidget({super.key, this.pdfUrl});

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  String? _viewId;
  String? _lastPdfUrl;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateResumeController>(builder: (controller) {

      final width = MediaQuery.sizeOf(Get.context!).width;
      final height = MediaQuery.sizeOf(Get.context!).height;
      if (kIsWeb) {
        if (_viewId == null || _lastPdfUrl != widget.pdfUrl) {
          _lastPdfUrl = widget.pdfUrl;
          _viewId = 'pdf-view-${Random().nextInt(100000)}';
          registerSecurePdfViewer(_viewId!, widget.pdfUrl!);
        }
        return SizedBox(width: width, height: height, child: HtmlElementView(viewType: _viewId!));
      } else {
        return SizedBox(width: width, height: height, child: SfPdfViewer.network(widget.pdfUrl!));
      }
    });
  }
}

