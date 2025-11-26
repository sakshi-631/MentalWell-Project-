import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/WIDGETS/constants.dart';

/// Reusable background widget with overlay
class Background extends StatelessWidget {
  final Widget child;
  const Background({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/bg_mentalwell.jpg', fit: BoxFit.cover),
        ),
        Positioned.fill(child: Container(color: kLight.withOpacity(0.85))),
        child,
      ],
    );
  }
}
