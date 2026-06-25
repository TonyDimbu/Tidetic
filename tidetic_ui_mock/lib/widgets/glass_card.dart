import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 28,
    this.margin,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: MockColors.neuDark,
            offset: const Offset(8, 12),
            blurRadius: 28,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: MockColors.neuLight,
            offset: const Offset(-6, -6),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: MockColors.glassFill,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: MockColors.glassEdge, width: 1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.35),
                  MockColors.gold.withValues(alpha: 0.04),
                ],
              ),
            ),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}
