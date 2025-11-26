import 'package:flutter/material.dart';

/// Animated Button Widget with hover and scale effect
class AnimatedScaleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const AnimatedScaleButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    this.borderRadius = 20,
  });

  @override
  State<AnimatedScaleButton> createState() => _AnimatedScaleButtonState();
}

class _AnimatedScaleButtonState extends State<AnimatedScaleButton> {
  double _scale = 1.0;
  Offset _hoverOffset = Offset.zero;

  void _onEnter(PointerEvent details) {
    setState(() {
      _hoverOffset = const Offset(4, -4);
      _scale = 1.05;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _hoverOffset = Offset.zero;
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _scale = 0.95),
        onTapUp: (_) {
          setState(() => _scale = 1.0);
          Future.delayed(const Duration(milliseconds: 80), widget.onTap);
        },
        onTapCancel: () => setState(() => _scale = 1.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: Matrix4.identity()
            ..translate(_hoverOffset.dx, _hoverOffset.dy)
            ..scale(_scale),
          curve: Curves.easeOutBack,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.22),
                blurRadius: 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
