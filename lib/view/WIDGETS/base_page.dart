import 'package:flutter/material.dart';
import 'package:mentalwellapp/view/WIDGETS/background.dart';

/// Common page layout wrapper with background and safe scroll area
class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: child,
          ),
        ),
      ),
    );
  }
}
