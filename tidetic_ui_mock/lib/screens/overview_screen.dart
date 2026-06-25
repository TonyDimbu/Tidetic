import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/mock_header.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 120),
      children: [
        const MockHeader(
          title: 'Overview',
          subtitle: 'Your week at a glance',
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('TODAY', style: mockLabel(context)),
                const SizedBox(height: 8),
                Text(
                  '+\$84',
                  style: mockText(
                    context,
                    size: 36,
                    weight: FontWeight.w600,
                    color: MockColors.gold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '2 trades · London session',
                  style: mockScreenSubtitle(context),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: GlassCard(
                  padding: const EdgeInsets.all(16),
                  radius: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STREAK', style: mockLabel(context)),
                      const SizedBox(height: 6),
                      Text(
                        '5 days',
                        style: mockText(
                          context,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GlassCard(
                  padding: const EdgeInsets.all(16),
                  radius: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LAST STATE', style: mockLabel(context)),
                      const SizedBox(height: 6),
                      Text(
                        'Calm',
                        style: mockText(
                          context,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            radius: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('THIS WEEK', style: mockLabel(context)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 56,
                  child: CustomPaint(
                    painter: _SparklinePainter(),
                    size: const Size(double.infinity, 56),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Playbook compliance 92%',
                  style: mockText(context, size: 13, color: MockColors.muted),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final points = [0.7, 0.5, 0.55, 0.35, 0.4, 0.25, 0.3];
    for (var i = 0; i < points.length; i++) {
      final x = size.width * (i / (points.length - 1));
      final y = size.height * points[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    final line = Paint()
      ..color = MockColors.slate
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, line);

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MockColors.slate.withValues(alpha: 0.15),
            MockColors.slate.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
