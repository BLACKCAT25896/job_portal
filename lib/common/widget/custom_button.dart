import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/styles.dart';

enum IconPosition { left, right }

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textColor = Colors.white,
    this.height = 35,
    this.width = double.infinity,
    this.borderRadius = 5,
    this.showTextOnly = false,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.icon,
    this.buttonColor,
    this.hoverColor,
    this.shadowColor,
    this.showBorderOnly = false,
    this.borderColor,
    this.textUnderline = false,
    this.boxShadow,
    this.buttonContentPosition = MainAxisAlignment.center,
    this.innerPadding,
    this.iconPosition = IconPosition.left,
    this.iconToTextSpace = 10,
    this.borderWidth,
  });

  final VoidCallback? onTap;
  final String text;
  final bool showTextOnly;
  final Color textColor;
  final Color? buttonColor;
  final Color? hoverColor;
  final Color? shadowColor;
  final Color? borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final MainAxisAlignment buttonContentPosition;
  final double height;
  final double width;
  final double borderRadius;
  final bool showBorderOnly;
  final bool textUnderline;
  final BoxShadow? boxShadow;
  final EdgeInsets? innerPadding;
  final Widget? icon;
  final IconPosition? iconPosition;
  final double? iconToTextSpace;
  final double? borderWidth;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isWebDesktop = ResponsiveHelper.isDesktop(context);

    final double finalHeight =
    isWebDesktop ? widget.height + 5 : widget.height;

    final Color bgColor = widget.showBorderOnly
        ? Colors.transparent
        : widget.showTextOnly
        ? Colors.transparent
        : widget.buttonColor ??
        (widget.onTap == null
            ? Colors.grey.shade500
            : systemPrimaryColor());

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: isWebDesktop && _isHovering
            ? (Matrix4.identity()..translateByDouble(0, -2, 0, 1))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          border: widget.borderColor == null
              ? null
              : Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 1.5,
          ),
          color: isWebDesktop && _isHovering
              ? widget.hoverColor ?? bgColor.withValues(alpha: 0.9)
              : bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: isWebDesktop && _isHovering
              ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
              : (widget.boxShadow != null ? [widget.boxShadow!] : null),
        ),
        width: widget.width,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: SizedBox(
              width: widget.width,
              height: finalHeight,
              child: Padding(
                padding: widget.innerPadding ??
                    const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: widget.buttonContentPosition,
                  mainAxisSize: isWebDesktop
                      ? MainAxisSize.min
                      : MainAxisSize.max,
                  children: [
                    if (widget.iconPosition == IconPosition.left &&
                        widget.icon != null) ...[
                      widget.icon!,
                      SizedBox(width: widget.iconToTextSpace),
                    ],
                    if (widget.text.isNotEmpty)
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            widget.text,
                            style: textRegular.copyWith(
                              decoration: widget.textUnderline
                                  ? TextDecoration.underline
                                  : null,
                              color: widget.onTap == null
                                  ? Theme.of(context).cardColor
                                  : widget.textColor,
                              fontSize: widget.fontSize,
                              fontWeight: widget.fontWeight,
                            ),
                          ),
                        ),
                      ),
                    if (widget.iconPosition == IconPosition.right &&
                        widget.icon != null) ...[
                      SizedBox(width: widget.iconToTextSpace),
                      widget.icon!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}