import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class NeuFab extends StatelessWidget {
  const NeuFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MockColors.creamDeep,
        boxShadow: [
          BoxShadow(
            color: MockColors.neuDark,
            offset: const Offset(6, 6),
            blurRadius: 14,
          ),
          BoxShadow(
            color: MockColors.neuLight,
            offset: const Offset(-5, -5),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(Icons.add, color: MockColors.ink, size: 26),
    );
  }
}
