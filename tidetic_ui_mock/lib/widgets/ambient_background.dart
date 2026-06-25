import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

/// Soft colour orbs so liquid glass panels read clearly.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: MockColors.cream),
        Positioned(
          top: -40,
          right: -30,
          child: _orb(220, MockColors.gold.withValues(alpha: 0.28)),
        ),
        Positioned(
          bottom: 120,
          left: -50,
          child: _orb(180, MockColors.slate.withValues(alpha: 0.14)),
        ),
        Positioned(
          top: 280,
          left: 60,
          child: _orb(140, MockColors.goldSoft.withValues(alpha: 0.2)),
        ),
        child,
      ],
    );
  }

  Widget _orb(double size, Color color) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
