import 'dart:async';

import 'package:flutter/material.dart';

/// Our custom fork of https://pub.dev/packages/modal_progress_hud adding a fading effect
///
/// wrapper around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [isLoading]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    required this.isLoading,
    required this.child,
    super.key,
    this.opacity = 0.5,
    this.progressIndicator = const CircularProgressIndicator(),
    this.color,
  });
  final bool isLoading;
  final double opacity;
  final Color? color;
  final Widget progressIndicator;
  final Widget child;

  @override
  _LoadingOverlayState createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  _LoadingOverlayState();
  late AnimationController _controller;
  late Animation<double> _animation;
  bool? _overlayVisible;

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller =
        AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      status == AnimationStatus.forward
          ? setState(() {
              _overlayVisible = true;
            })
          : null;
      status == AnimationStatus.dismissed
          ? setState(() {
              _overlayVisible = false;
            })
          // ignore: unnecessary_statements
          : null;
    });
    if (widget.isLoading) {
      unawaited(_controller.forward());
    }
  }

  @override
  void didUpdateWidget(LoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      unawaited(_controller.forward());
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      unawaited(_controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    // ignore: cascade_invocations
    widgets.add(widget.child);

    // ignore: use_if_null_to_convert_nulls_to_bools
    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.opacity,
              child: const ModalBarrier(
                dismissible: false,
                color: Colors.black,
              ),
            ),
            Center(child: widget.progressIndicator),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}
