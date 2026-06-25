import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mock_shell.dart';
import 'theme/mock_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: MockColors.cream,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const TideticUiMockApp());
}

/// Standalone UI concept — not wired to production app (projo).
class TideticUiMockApp extends StatelessWidget {
  const TideticUiMockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tidetic UI Mock',
      debugShowCheckedModeBanner: false,
      theme: buildMockTheme(),
      home: const MockShell(),
    );
  }
}
