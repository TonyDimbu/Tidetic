import 'package:flutter/material.dart';
import '../widgets/ambient_background.dart';
import '../widgets/mock_nav_bar.dart';
import '../widgets/neu_fab.dart';
import 'analytics_screen.dart';
import 'insights_screen.dart';
import 'journal_screen.dart';
import 'overview_screen.dart';

class MockShell extends StatefulWidget {
  const MockShell({super.key});

  @override
  State<MockShell> createState() => _MockShellState();
}

class _MockShellState extends State<MockShell> {
  int _tab = 1;

  static const _screens = [
    OverviewScreen(),
    JournalScreen(),
    AnalyticsScreen(),
    InsightsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              IndexedStack(
                index: _tab,
                children: _screens,
              ),
              Positioned(
                right: 20,
                bottom: 100,
                child: const NeuFab(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: MockNavBar(
                  currentIndex: _tab,
                  onTap: (i) => setState(() => _tab = i),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
