import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/mock_header.dart';
import '../widgets/period_toggle.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 120),
      children: [
        const MockHeader(
          title: 'Insights',
          subtitle: 'Patterns & reflections',
        ),
        const SizedBox(height: 16),
        const PeriodToggle(initialIndex: 1, glowCyanOnActive: true),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MockColors.creamDeep,
                    boxShadow: [
                      BoxShadow(
                        color: MockColors.neuDark,
                        offset: const Offset(4, 4),
                        blurRadius: 12,
                      ),
                      BoxShadow(
                        color: MockColors.neuLight,
                        offset: const Offset(-3, -3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.auto_awesome_outlined,
                    color: MockColors.gold,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Patterns appear when you’ve\nlogged enough to compare.',
                  textAlign: TextAlign.center,
                  style: mockText(
                    context,
                    size: 15,
                    weight: FontWeight.w400,
                    color: MockColors.muted,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('OBSERVED PATTERNS', style: mockLabel(context)),
        ),
        const SizedBox(height: 12),
        _InsightStrip(
          title: 'Calm before London open',
          detail: 'Win rate 68% when state logged as Calm',
          accent: MockColors.gold,
        ),
        _InsightStrip(
          title: 'Rushed entries after loss',
          detail: '3 of last 4 losing trades followed Rushed tag',
          accent: MockColors.brick,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            radius: 20,
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WEEKLY REFLECTION', style: mockLabel(context)),
                const SizedBox(height: 10),
                Text(
                  '"I notice I trade smaller when I write how I feel first."',
                  style: mockText(
                    context,
                    size: 15,
                    weight: FontWeight.w400,
                    height: 1.5,
                    color: MockColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Apr 14 – Apr 20',
                  style: mockText(context, size: 11, color: MockColors.muted),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InsightStrip extends StatelessWidget {
  const _InsightStrip({
    required this.title,
    required this.detail,
    required this.accent,
  });

  final String title;
  final String detail;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: GlassCard(
        radius: 18,
        padding: const EdgeInsets.fromLTRB(18, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 3,
              height: 44,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: mockText(
                      context,
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    detail,
                    style: mockText(context, size: 12, color: MockColors.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
