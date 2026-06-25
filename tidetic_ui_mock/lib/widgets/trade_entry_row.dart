import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';
import 'glass_card.dart';

enum TradeResult { win, loss, flat }

class TradeEntryRow extends StatelessWidget {
  const TradeEntryRow({
    super.key,
    required this.pair,
    required this.pnl,
    required this.session,
    required this.state,
    required this.result,
  });

  final String pair;
  final String pnl;
  final String session;
  final String state;
  final TradeResult result;

  Color get _accent {
    switch (result) {
      case TradeResult.win:
        return MockColors.gold;
      case TradeResult.loss:
        return MockColors.brick;
      case TradeResult.flat:
        return MockColors.muted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      radius: 22,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: _accent,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(22),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pair,
                            style: mockText(
                              context,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$session · $state',
                            style: mockText(
                              context,
                              size: 11,
                              weight: FontWeight.w500,
                              color: MockColors.muted,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      pnl,
                      style: mockText(
                        context,
                        size: 17,
                        weight: FontWeight.w600,
                        color: _accent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
