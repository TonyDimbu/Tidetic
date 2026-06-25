import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class SegmentChips extends StatefulWidget {
  const SegmentChips({
    super.key,
    required this.options,
    this.initialIndex = 0,
  });

  final List<String> options;
  final int initialIndex;

  @override
  State<SegmentChips> createState() => _SegmentChipsState();
}

class _SegmentChipsState extends State<SegmentChips> {
  late int _selected = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.options.length, (i) {
        final active = i == _selected;
        return Padding(
          padding: EdgeInsets.only(left: i == 0 ? 0 : 6),
          child: GestureDetector(
            onTap: () => setState(() => _selected = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: active ? MockColors.ink : Colors.transparent,
              ),
              child: Text(
                widget.options[i],
                style: mockText(
                  context,
                  size: 11,
                  weight: FontWeight.w600,
                  color: active ? const Color(0xFFF5F0E8) : MockColors.muted,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
