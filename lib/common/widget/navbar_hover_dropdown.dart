import 'package:flutter/material.dart';

class NavbarHoverDropdown<T> extends StatefulWidget {
  final Widget button;
  final List<T> items;
  final Widget Function(T) title;
  final Widget Function(T)? trailing;
  final void Function(T) onTap;
  final double width;

  const NavbarHoverDropdown({
    super.key,
    required this.button,
    required this.items,
    required this.title,
    required this.onTap,
    this.trailing,
    this.width = 280,
  });

  @override
  State<NavbarHoverDropdown<T>> createState() =>
      _NavbarHoverDropdownState<T>();
}

class _NavbarHoverDropdownState<T> extends State<NavbarHoverDropdown<T>>
    with TickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isHovering = false;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 200),
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curved);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.08),
      end: Offset.zero,
    ).animate(curved);

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(curved);
  }

  void _showOverlay() {
    if (_overlayEntry != null || !mounted) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: widget.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 45),
          showWhenUnlinked: false,
          child: MouseRegion(
            onEnter: (_) => _isHovering = true,
            onExit: (_) => _handleExit(),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 14,
                    shadowColor: Colors.black.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 400,
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                        itemBuilder: (context, index) {
                          final item = widget.items[index];

                          return InkWell(
                            onTap: () {
                              widget.onTap(item);
                              _removeOverlay();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.title(item),
                                  if (widget.trailing != null)
                                    widget.trailing!(item),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Safe insert (prevents mouse tracker crash)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _overlayEntry == null) return;
      Overlay.of(context).insert(_overlayEntry!);
      _controller.forward();
    });
  }

  void _handleExit() {
    _isHovering = false;
    Future.delayed(const Duration(milliseconds: 180), () {
      if (!_isHovering) {
        _removeOverlay();
      }
    });
  }

  Future<void> _removeOverlay() async {
    if (!mounted) return;

    await _controller.reverse();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          _isHovering = true;
          Future.microtask(() {
            if (_isHovering) _showOverlay();
          });
        },
        onExit: (_) => _handleExit(),
        child: widget.button,
      ),
    );
  }
}
