import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';

class MockHeader extends StatelessWidget {
  const MockHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: mockScreenTitle(context)),
                const SizedBox(height: 4),
                Text(subtitle, style: mockScreenSubtitle(context)),
              ],
            ),
          ),
          _ProfileButton(),
        ],
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MockColors.creamDeep,
        boxShadow: [
          BoxShadow(
            color: MockColors.neuDark,
            offset: const Offset(4, 4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: MockColors.neuLight,
            offset: const Offset(-3, -3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Icon(Icons.person_outline, size: 20, color: MockColors.muted),
    );
  }
}
