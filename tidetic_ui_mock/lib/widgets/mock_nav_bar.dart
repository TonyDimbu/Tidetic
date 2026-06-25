import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class MockNavBar extends StatelessWidget {
  const MockNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: Icons.grid_view_rounded, label: 'Overview'),
    (icon: Icons.menu_book_outlined, label: 'Journal'),
    (icon: Icons.show_chart_rounded, label: 'Analytics'),
    (icon: Icons.lightbulb_outline_rounded, label: 'Insights'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: MockColors.glassFill,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: MockColors.glassEdge),
              boxShadow: [
                BoxShadow(
                  color: MockColors.neuDark,
                  offset: const Offset(0, 10),
                  blurRadius: 24,
                ),
                BoxShadow(
                  color: MockColors.neuLight,
                  offset: const Offset(-4, -4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_items.length, (i) {
                final active = i == currentIndex;
                return GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: EdgeInsets.symmetric(
                      horizontal: active ? 16 : 12,
                      vertical: 10,
                    ),
                    decoration: active
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: MockColors.creamDeep,
                            boxShadow: [
                              BoxShadow(
                                color: MockColors.neuDark.withValues(alpha: 0.45),
                                offset: const Offset(2, 2),
                                blurRadius: 4,
                              ),
                              BoxShadow(
                                color: MockColors.neuLight,
                                offset: const Offset(-2, -2),
                                blurRadius: 6,
                              ),
                            ],
                          )
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _items[i].icon,
                          size: 20,
                          color: active ? MockColors.gold : MockColors.muted,
                        ),
                        if (active) ...[
                          const SizedBox(width: 8),
                          Text(
                            _items[i].label,
                            style: mockText(
                              context,
                              size: 12,
                              weight: FontWeight.w600,
                              color: MockColors.gold,
                            ),
                          ),
                        ],
                      ],
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
