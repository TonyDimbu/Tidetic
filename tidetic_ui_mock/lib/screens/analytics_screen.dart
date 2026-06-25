import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/mock_header.dart';
import '../widgets/period_toggle.dart';
import '../widgets/segment_chips.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 120),
      children: [
        const MockHeader(
          title: 'Analytics',
          subtitle: 'Performance breakdown',
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EQUITY CURVE', style: mockLabel(context)),
                const SizedBox(height: 8),
                Text(
                  '+\$60',
                  style: mockText(
                    context,
                    size: 40,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: CustomPaint(
                    painter: _EquityCurvePainter(),
                    size: const Size(double.infinity, 100),
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -12),
          child: const PeriodToggle(initialIndex: 3),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PERFORMANCE', style: mockLabel(context)),
              const SegmentChips(
                options: ['Session', 'D', 'W', 'M'],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            radius: 22,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Column(
              children: [
                _SessionBar(label: 'Asia', value: 0, pnl: '+\$0'),
                _SessionBar(label: 'LDN', value: 0.15, pnl: '+\$0'),
                _SessionBar(label: 'NY', value: 0.1, pnl: '+\$0'),
                _SessionBar(label: 'Ovlp', value: 0.12, pnl: '+\$0'),
                _SessionBar(label: 'London', value: 0.85, pnl: '+\$80', highlight: true),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('COMMON MISTAKES', style: mockLabel(context)),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'No mistakes logged yet.',
            textAlign: TextAlign.center,
            style: mockText(context, size: 14, color: MockColors.muted),
          ),
        ),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('PLAYBOOK COMPLIANCE', style: mockLabel(context)),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GlassCard(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('OVERALL COMPLIANCE', style: mockLabel(context)),
                    const SizedBox(height: 8),
                    Text(
                      '100.0%',
                      style: mockText(
                        context,
                        size: 32,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'No rules tracked in this period.',
                      style: mockText(context, size: 12, color: MockColors.muted),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Row(
                    children: [
                      _FloatingOrb(icon: Icons.shield_outlined),
                      const SizedBox(width: 8),
                      _FloatingOrb(icon: Icons.add, small: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SessionBar extends StatelessWidget {
  const _SessionBar({
    required this.label,
    required this.value,
    required this.pnl,
    this.highlight = false,
  });

  final String label;
  final double value;
  final String pnl;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 48,
            child: Text(
              label,
              style: mockText(context, size: 11, color: MockColors.muted),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 72 * value.clamp(0.08, 1.0),
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: highlight
                        ? [MockColors.slate, MockColors.slate.withValues(alpha: 0.35)]
                        : [
                            MockColors.slate.withValues(alpha: 0.5),
                            MockColors.slate.withValues(alpha: 0.2),
                          ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 44,
            child: Text(
              pnl,
              textAlign: TextAlign.right,
              style: mockText(
                context,
                size: 11,
                weight: FontWeight.w600,
                color: highlight ? MockColors.gold : MockColors.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingOrb extends StatelessWidget {
  const _FloatingOrb({required this.icon, this.small = false});

  final IconData icon;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final size = small ? 36.0 : 44.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MockColors.glassFill,
        border: Border.all(color: MockColors.glassEdge),
        boxShadow: [
          BoxShadow(
            color: MockColors.neuDark,
            offset: const Offset(4, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(icon, size: small ? 18 : 22, color: MockColors.muted),
    );
  }
}

class _EquityCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final pts = [0.75, 0.72, 0.55, 0.58, 0.42, 0.38, 0.28, 0.22];
    for (var i = 0; i < pts.length; i++) {
      final x = size.width * (i / (pts.length - 1));
      final y = size.height * pts[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevX = size.width * ((i - 1) / (pts.length - 1));
        final prevY = size.height * pts[i - 1];
        final cx = (prevX + x) / 2;
        path.quadraticBezierTo(cx, prevY, x, y);
      }
    }

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
            MockColors.slate.withValues(alpha: 0.2),
            MockColors.slate.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = MockColors.slate
        ..strokeWidth = 2.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
