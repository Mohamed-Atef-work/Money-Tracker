import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;
  const CustomFadingWidget({super.key, required this.child});

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }

  void _init() {
    const duration = Duration(milliseconds: 900);
    animationController = AnimationController(vsync: this, duration: duration);
    final tween = Tween<double>(begin: 0.3, end: 0.8);
    animation = tween.animate(animationController);
    animationController.repeat(reverse: true);
    animation.addListener(_listener);
  }

  void _listener() {
    setState(() {});
  }
}
