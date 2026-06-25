import 'package:flutter/material.dart';

/// Redesign tokens aligned with the landing page (cream, gold, liquid glass).
abstract final class MockColors {
  static const cream = Color(0xFFF3EFE6);
  static const creamDeep = Color(0xFFEBE6DC);
  static const ink = Color(0xFF2C2A26);
  static const muted = Color(0xFF6F6A62);
  static const gold = Color(0xFFC5A059);
  static const goldSoft = Color(0xFFDCC48A);
  static const brick = Color(0xFFA33B32);
  static const slate = Color(0xFF4A5568);
  static const glassFill = Color(0x85FCF8F0);
  static const glassEdge = Color(0xBFFFFCF5);
  static const neuDark = Color(0x38A09480);
  static const neuLight = Color(0xD9FFFCF5);
  static const cyanGlow = Color(0x4D7EB8C4);
}

/// Bundled in pubspec.yaml — must match [family] name there exactly.
const mockFontFamily = 'Stack Sans Notch';

TextStyle mockText(
  BuildContext context, {
  double size = 14,
  FontWeight weight = FontWeight.w400,
  Color? color,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontFamily: mockFontFamily,
    fontSize: size,
    fontWeight: weight,
    color: color ?? MockColors.ink,
    letterSpacing: letterSpacing,
    height: height,
  );
}

TextStyle mockLabel(BuildContext context) => mockText(
      context,
      size: 10,
      weight: FontWeight.w600,
      color: MockColors.muted,
      letterSpacing: 1.4,
    );

TextStyle mockScreenTitle(BuildContext context) => mockText(
      context,
      size: 28,
      weight: FontWeight.w600,
      height: 1.1,
    );

TextStyle mockScreenSubtitle(BuildContext context) => mockText(
      context,
      size: 14,
      weight: FontWeight.w300,
      color: MockColors.muted,
    );

ThemeData buildMockTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: MockColors.cream,
    fontFamily: mockFontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: MockColors.gold,
      brightness: Brightness.light,
      surface: MockColors.cream,
      onSurface: MockColors.ink,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(fontFamily: mockFontFamily),
    primaryTextTheme: base.primaryTextTheme.apply(fontFamily: mockFontFamily),
  );
}
