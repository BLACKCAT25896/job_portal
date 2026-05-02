import 'package:flutter/material.dart';

/// Simple item model
class SimpleMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SimpleMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

/// Hover + click dropdown menu (scrollable & dynamic screen height)
class SimpleDropdownMenu extends StatefulWidget {
  final Widget button;
  final List<SimpleMenuItem> items;
  final Color backgroundColor;
  final double width;
  final double? maxHeight; // optional, will default to screen height fraction

  const SimpleDropdownMenu({
    super.key,
    required this.button,
    required this.items,
    required this.backgroundColor,
    this.width = 180,
    this.maxHeight,
  });

  @override
  State<SimpleDropdownMenu> createState() => _SimpleDropdownMenuState();
}

class _SimpleDropdownMenuState extends State<SimpleDropdownMenu> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  double get _calculatedMaxHeight =>
      widget.maxHeight ?? MediaQuery.of(context).size.height * 0.85;

  void _openMenu() {
    if (_isOpen) return;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: Stack(
            children: [
              // Tap outside to close
              Positioned.fill(
                child: GestureDetector(
                  onTap: _closeMenu,
                  behavior: HitTestBehavior.translucent,
                ),
              ),

              // Menu itself
              CompositedTransformFollower(
                link: _layerLink,
                offset: const Offset(0, 48),
                showWhenUnlinked: false,
                child: MouseRegion(
                  onExit: (_) => _closeMenu(),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    color: widget.backgroundColor,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: widget.width,
                        maxHeight: _calculatedMaxHeight,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.items.map((item) {
                            return InkWell(
                              onTap: () {
                                _closeMenu();
                                Future.delayed(
                                  const Duration(milliseconds: 120),
                                  item.onTap,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      item.icon,
                                      size: 22,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isOpen = true;
  }

  void _closeMenu() {
    if (!_isOpen) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _openMenu(),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _openMenu,
          child: widget.button,
        ),
      ),
    );
  }
}
