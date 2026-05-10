import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CustomRichEditorV2 extends StatefulWidget {
  final QuillController? controller;
  final Color? toolbarColor;
  final String? title;
  final String? hintText;
  final bool required;
  final double? height;
  final bool showToolbar;

  const CustomRichEditorV2({
    super.key,
    required this.controller,
    this.toolbarColor,
    this.title,
    this.hintText,
    this.required = false,
    this.height,
    this.showToolbar = true,
  });

  @override
  State<CustomRichEditorV2> createState() => _CustomRichEditorV2State();
}

class _CustomRichEditorV2State extends State<CustomRichEditorV2> {
  late FocusNode _focusNode;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Title
        if (widget.title != null)
          Padding(
            padding:  EdgeInsets.only(
              bottom: Dimensions.paddingSizeSmall,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: widget.title!,
                    style: textRegular.copyWith(
                      fontSize: Dimensions.fontSizeLarge,
                    ),
                  ),
                  if (widget.required)
                    const TextSpan(
                      text: " *",
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),

        /// Toolbar
        if (widget.showToolbar)
          Container(
            color: widget.toolbarColor ?? Colors.grey.shade200,
            child: QuillSimpleToolbar(
              controller: widget.controller!,
            ),
          ),

        /// Editor
        Container(
          height: widget.height ?? 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).disabledColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.radiusDefault,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0), // ✅ padding added
            child: QuillEditor(
              controller: widget.controller!,
              focusNode: _focusNode,
              scrollController: _scrollController,
              config: QuillEditorConfig(
                placeholder: widget.hintText ?? 'Enter text...',
              ),
            ),
          ),
        ),
      ],
    );
  }
}