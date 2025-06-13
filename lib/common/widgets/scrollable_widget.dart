import 'package:flutter/material.dart';

class ScrollableScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool safeArea;

  const ScrollableScreen({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    return Scaffold(
      body: safeArea ? SafeArea(child: content) : content,
    );
  }
}
