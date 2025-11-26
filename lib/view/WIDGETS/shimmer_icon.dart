import 'package:flutter/material.dart';

class ShimmerIcon extends StatefulWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const ShimmerIcon({
    super.key,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  State<ShimmerIcon> createState() => _ShimmerIconState();
}

class _ShimmerIconState extends State<ShimmerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _anim = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _anim,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [widget.color1, widget.color2, widget.color1],
                stops: [
                  0.1,
                  (0.3 + 0.4 * _anim.value).clamp(0.0, 1.0),
                  1.0
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Icon(widget.icon,
                size: 40, color: Colors.white.withOpacity(0.87)),
          );
        });
  }
}
