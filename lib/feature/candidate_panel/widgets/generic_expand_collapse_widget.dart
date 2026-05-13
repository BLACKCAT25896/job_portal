import 'package:flutter/material.dart';

class CustomExpandCollapse extends StatefulWidget {
  final Widget header;
  final Widget child;

  /// local mode
  final bool initiallyExpanded;

  /// external control mode (optional)
  final bool? isExpanded;
  final ValueChanged<bool>? onChanged;

  final Duration duration;

  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? childPadding;

  final Color? backgroundColor;
  final Color? expandedBackgroundColor;

  final BorderRadius? borderRadius;

  final Widget? trailing;

  const CustomExpandCollapse({
    super.key,
    required this.header,
    required this.child,

    this.initiallyExpanded = false,

    this.isExpanded,
    this.onChanged,

    this.duration = const Duration(milliseconds: 250),

    this.headerPadding,
    this.childPadding,

    this.backgroundColor,
    this.expandedBackgroundColor,

    this.borderRadius,

    this.trailing,
  });

  @override
  State<CustomExpandCollapse> createState() =>
      _CustomExpandCollapseState();
}

class _CustomExpandCollapseState
    extends State<CustomExpandCollapse> with SingleTickerProviderStateMixin {

  late bool isExpanded;

  bool get _isControlled => widget.isExpanded != null;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  void didUpdateWidget(covariant CustomExpandCollapse oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_isControlled &&
        widget.isExpanded != isExpanded) {
      isExpanded = widget.isExpanded!;
    }
  }

  void toggle() {
    final newValue = !isExpanded;

    if (_isControlled) {
      widget.onChanged?.call(newValue);
    } else {
      setState(() {
        isExpanded = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius =
        widget.borderRadius ?? BorderRadius.circular(10);

    return AnimatedContainer(
      duration: widget.duration,
      decoration: BoxDecoration(
        color: isExpanded
            ? widget.expandedBackgroundColor
            : widget.backgroundColor,
        borderRadius: radius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          InkWell(
            borderRadius: radius,
            onTap: toggle,
            child: Padding(
              padding: widget.headerPadding ??
                  const EdgeInsets.all(16),
              child: Row(
                children: [

                  Expanded(child: widget.header),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      if (widget.trailing != null) ...[
                        widget.trailing!,
                        const SizedBox(width: 6),
                      ],

                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: widget.duration,
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          ClipRect(
            child: AnimatedSize(
              duration: widget.duration,
              curve: Curves.easeInOut,
              child: Align(
                alignment: Alignment.centerLeft,
                heightFactor: isExpanded ? 1 : 0,
                child: Padding(
                  padding: widget.childPadding ??
                      const EdgeInsets.all(16),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}