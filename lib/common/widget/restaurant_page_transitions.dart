import 'package:flutter/material.dart';

/// Custom page transitions for mighty_job management system
/// Provides smooth, professional transitions that enhance the user experience
class mighty_jobPageTransitions {
  
  /// Slide transition from right to left (for forward navigation)
  static PageRouteBuilder<T> slideFromRight<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// Slide transition from left to right (for back navigation)
  static PageRouteBuilder<T> slideFromLeft<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// Fade transition with scale (for modal-like pages)
  static PageRouteBuilder<T> fadeWithScale<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOutQuart;
        
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: curve),
        );
        
        var scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: curve),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
    );
  }

  /// Slide up transition (for bottom sheets and modals)
  static PageRouteBuilder<T> slideFromBottom<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// mighty_job workflow transition (combines slide and fade)
  static PageRouteBuilder<T> workflowTransition<T>(Widget page, {bool isForward = true}) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideBegin = isForward ? const Offset(0.3, 0.0) : const Offset(-0.3, 0.0);
        const slideEnd = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var slideAnimation = Tween(begin: slideBegin, end: slideEnd).animate(
          CurvedAnimation(parent: animation, curve: curve),
        );
        
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: curve),
        );

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }

  /// Custom transition for dashboard navigation
  static PageRouteBuilder<T> dashboardTransition<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Multi-stage animation
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );
        
        var scaleAnimation = Tween(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutBack),
          ),
        );
        
        var slideAnimation = Tween(begin: const Offset(0.0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

        return SlideTransition(
          position: slideAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

/// Extension to easily apply transitions to navigation
extension mighty_jobNavigation on BuildContext {
  
  /// Navigate with slide from right transition
  Future<T?> pushWithSlideFromRight<T>(Widget page) {
    return Navigator.of(this).push<T>(
      mighty_jobPageTransitions.slideFromRight<T>(page),
    );
  }
  
  /// Navigate with fade and scale transition
  Future<T?> pushWithFadeScale<T>(Widget page) {
    return Navigator.of(this).push<T>(
      mighty_jobPageTransitions.fadeWithScale<T>(page),
    );
  }

  /// Navigate with workflow transition
  Future<T?> pushWithWorkflowTransition<T>(Widget page, {bool isForward = true}) {
    return Navigator.of(this).push<T>(
      mighty_jobPageTransitions.workflowTransition<T>(page, isForward: isForward),
    );
  }

  /// Navigate with slide from bottom transition
  Future<T?> pushWithSlideFromBottom<T>(Widget page) {
    return Navigator.of(this).push<T>(
      mighty_jobPageTransitions.slideFromBottom<T>(page),
    );
  }

  /// Navigate to dashboard with special transition
  Future<T?> pushToDashboard<T>(Widget page) {
    return Navigator.of(this).push<T>(
      mighty_jobPageTransitions.dashboardTransition<T>(page),
    );
  }
}

/// Animated container for smooth state changes
class mighty_jobAnimatedContainer extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool isVisible;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  const mighty_jobAnimatedContainer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.isVisible = true,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: duration,
      curve: curve,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
