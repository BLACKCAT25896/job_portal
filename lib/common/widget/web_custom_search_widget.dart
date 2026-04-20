import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/util/images.dart';

class TypewriterSearchField<T> extends StatefulWidget {
  final String hint;
  final List<T> items;

  /// Used for filtering/search logic
  final String Function(T item) searchText;

  /// Used for building dropdown item UI
  final Widget Function(T item) itemBuilder;

  final void Function(T item) onItemSelected;
  final void Function(String text)? onChanged;

  const TypewriterSearchField({
    super.key,
    required this.hint,
    required this.items,
    required this.searchText,
    required this.itemBuilder,
    required this.onItemSelected,
    this.onChanged,
  });

  @override
  State<TypewriterSearchField<T>> createState() =>
      _TypewriterSearchFieldState<T>();
}

class _TypewriterSearchFieldState<T>
    extends State<TypewriterSearchField<T>> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  String displayedHint = "";
  int hintIndex = 0;
  Timer? _hintTimer;
  List<T> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    _startTypewriterHint();
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(covariant TypewriterSearchField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    filteredItems = widget.items;
  }

  void _onTextChanged() {
    final text = _controller.text;

    setState(() {
      filteredItems = widget.items
          .where((item) => widget
          .searchText(item)
          .toLowerCase()
          .contains(text.toLowerCase()))
          .toList();
    });

    widget.onChanged?.call(text);

    if (text.isNotEmpty && filteredItems.isNotEmpty) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _startTypewriterHint() {
    _hintTimer =
        Timer.periodic(const Duration(milliseconds: 150), (timer) {
          if (!mounted) return;

          setState(() {
            if (hintIndex < widget.hint.length) {
              displayedHint += widget.hint[hintIndex];
              hintIndex++;
            } else {
              hintIndex = 0;
              displayedHint = "";
            }
          });
        });
  }

  void _showOverlay() {
    _removeOverlay();

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints:
              const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return InkWell(
                    onTap: () {
                      widget.onItemSelected(item);
                      _controller.text =
                          widget.searchText(item);
                      _removeOverlay();
                    },
                    child: widget.itemBuilder(item),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hintTimer?.cancel();
    _controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(height: 50,
        decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300)),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: displayedHint,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: CustomImage(
                image: Images.search,
                width: 20,
                height: 20,
                isLocalAsset: true,
              ),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? InkWell(
              onTap: () {
                _controller.clear();
                _removeOverlay();
              },
              child: const Icon(Icons.clear,
                  color: Colors.red),
            )
                : null,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
