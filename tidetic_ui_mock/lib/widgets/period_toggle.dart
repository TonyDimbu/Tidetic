import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class PeriodToggle extends StatefulWidget {
  const PeriodToggle({
    super.key,
    this.options = const ['1W', '1M', '3M', 'All', 'Custom'],
    this.initialIndex = 3,
    this.glowCyanOnActive = false,
  });

  final List<String> options;
  final int initialIndex;
  final bool glowCyanOnActive;

  @override
  State<PeriodToggle> createState() => _PeriodToggleState();
}

class _PeriodToggleState extends State<PeriodToggle> {
  late int _selected = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: MockColors.glassFill,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: MockColors.glassEdge),
              boxShadow: [
                BoxShadow(
                  color: MockColors.neuDark,
                  offset: const Offset(0, 6),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Row(
              children: List.generate(widget.options.length, (i) {
                final active = i == _selected;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selected = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: active ? MockColors.creamDeep : Colors.transparent,
                        boxShadow: active
                            ? [
                                BoxShadow(
                                  color: MockColors.neuDark.withValues(alpha: 0.5),
                                  offset: const Offset(1, 2),
                                  blurRadius: 4,
                                  spreadRadius: -1,
                                ),
                                if (widget.glowCyanOnActive)
                                  BoxShadow(
                                    color: MockColors.cyanGlow,
                                    offset: const Offset(0, -3),
                                    blurRadius: 8,
                                  ),
                              ]
                            : null,
                      ),
                      child: Text(
                        widget.options[i],
                        textAlign: TextAlign.center,
                        style: mockText(
                          context,
                          size: 11,
                          weight: active ? FontWeight.w600 : FontWeight.w400,
                          color: active ? MockColors.ink : MockColors.muted,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
