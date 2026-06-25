import 'package:flutter_test/flutter_test.dart';
import 'package:tidetic_ui_mock/main.dart';

void main() {
  testWidgets('Mock app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const TideticUiMockApp());
    expect(find.text('Journal'), findsOneWidget);
  });
}
