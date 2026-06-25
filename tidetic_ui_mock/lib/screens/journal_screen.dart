import 'package:flutter/material.dart';
import '../theme/mock_theme.dart';
import '../widgets/mock_header.dart';
import '../widgets/period_toggle.dart';
import '../widgets/trade_entry_row.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 120),
      children: [
        const MockHeader(
          title: 'Journal',
          subtitle: 'Your trade log',
        ),
        const SizedBox(height: 16),
        const PeriodToggle(initialIndex: 3),
        const SizedBox(height: 28),
        _dateSection(context, 'TODAY', const [
          TradeEntryRow(
            pair: 'EUR/USD',
            pnl: '+\$120',
            session: 'LONDON',
            state: 'CALM',
            result: TradeResult.win,
          ),
          TradeEntryRow(
            pair: 'GBP/JPY',
            pnl: '-\$45',
            session: 'NY',
            state: 'RUSHED',
            result: TradeResult.loss,
          ),
        ]),
        const SizedBox(height: 28),
        _dateSection(context, 'YESTERDAY', const [
          TradeEntryRow(
            pair: 'XAU/USD',
            pnl: '+\$80',
            session: 'ASIA',
            state: 'FOCUSED',
            result: TradeResult.win,
          ),
          TradeEntryRow(
            pair: 'NAS100',
            pnl: '\$0',
            session: 'OVERLAP',
            state: 'NEUTRAL',
            result: TradeResult.flat,
          ),
        ]),
      ],
    );
  }

  Widget _dateSection(
    BuildContext context,
    String label,
    List<Widget> entries,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: mockLabel(context)),
          const SizedBox(height: 12),
          ...entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: e,
            ),
          ),
        ],
      ),
    );
  }
}
