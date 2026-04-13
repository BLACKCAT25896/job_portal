import 'package:flutter/material.dart';
Future<void> showModalSideSheet(
    BuildContext context, {
      required Widget body,
       Widget? footer,
      required String header,
      bool barrierDismissible = false,
      bool addBackIconButton = false,
      bool addCloseIconButton = true,
      bool addActions = true,
      bool addDivider = true,
      bool safeAreaTop = true,
      bool safeAreaBottom = false,
      String confirmActionTitle = 'Save',
      String cancelActionTitle = 'Cancel',
      String? closeButtonTooltip = 'Close',
      String? backButtonTooltip = 'Back',
      void Function()? confirmActionOnPressed,
      void Function()? cancelActionOnPressed,
      void Function()? onDismiss,
      void Function()? onClose,
      Duration? transitionDuration,
    }) async {
  await showGeneralDialog(
    context: context,
    transitionDuration: transitionDuration ?? Duration(milliseconds: 500),
    barrierDismissible: barrierDismissible,
    barrierColor: Theme.of(context).colorScheme.scrim.withValues(alpha: 0.3),
    barrierLabel: 'Material 3 side sheet',
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(
          animation,
        ),
        child: child,
      );
    },
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.centerRight,
        child: SideSheetMaterial3(
          header: header,
          body: body,
          footer: footer,
          addBackIconButton: addBackIconButton,
          addActions: addActions,
          addDivider: addDivider,
          safeAreaTop: safeAreaTop,
          safeAreaBottom: safeAreaBottom,
          confirmActionOnPressed: confirmActionOnPressed,
          cancelActionOnPressed: cancelActionOnPressed,
          confirmActionTitle: confirmActionTitle,
          cancelActionTitle: cancelActionTitle,
          closeButtonTooltip: closeButtonTooltip,
          backButtonTooltip: backButtonTooltip,
          addCloseIconButton: addCloseIconButton,
          onClose: onClose,
        ),
      );
    },
  ).then(
        (value) {
      if (!barrierDismissible) return;
      if (onDismiss != null) {
        onDismiss();
      }
    },
  );
}

class SideSheetMaterial3 extends StatelessWidget {
  final String header;
  final Widget body;
  final Widget? footer;
  final bool addBackIconButton;
  final bool addCloseIconButton;
  final bool addActions;
  final bool addDivider;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final String confirmActionTitle;
  final String cancelActionTitle;
  final String? closeButtonTooltip;
  final String? backButtonTooltip;

  final void Function()? confirmActionOnPressed;
  final void Function()? cancelActionOnPressed;
  final void Function()? onClose;
  const SideSheetMaterial3({
    super.key,
    required this.header,
    required this.body,
    this.footer,
    required this.addBackIconButton,
    required this.addActions,
    required this.addDivider,
    required this.safeAreaBottom,
    required this.safeAreaTop,
    required this.cancelActionOnPressed,
    required this.confirmActionOnPressed,
    required this.cancelActionTitle,
    required this.confirmActionTitle,
    required this.closeButtonTooltip,
    required this.backButtonTooltip,
    required this.addCloseIconButton,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Material(
      elevation: 1,
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      child: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        minimum: EdgeInsets.only(top: addBackIconButton ? 16 : 24),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 256,
            maxWidth: size.width <= 600 ? size.width : 400,
            minHeight: size.height,
            maxHeight: size.height,
          ),
          child: Column(
            children: [
              _buildHeader(textTheme, context),
              Expanded(
                child: body,
              ),
              if(footer != null)
                footer??SizedBox()

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      TextTheme textTheme,
      BuildContext context,
      ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(addBackIconButton ? 16 : 24, 0, 16, 16),
      child: Row(
        children: [
          Visibility(
            visible: addBackIconButton,
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {
                  if (onClose == null) {
                    Navigator.pop(context);
                  } else {
                    onClose!();
                  }
                },
                tooltip: backButtonTooltip,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Text(
            header,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(width: addCloseIconButton ? 12 : 8),
          ),
          Visibility(
            visible: addCloseIconButton,
            child: IconButton(
              onPressed: () {
                if (onClose == null) {
                  Navigator.pop(context);
                } else {
                  onClose!();
                }
              },
              tooltip: closeButtonTooltip,
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
