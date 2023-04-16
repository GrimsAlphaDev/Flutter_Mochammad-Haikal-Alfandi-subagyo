import 'package:flutter/cupertino.dart';
import 'package:flutter_app_section_12_praktikum/Decider/decider_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'decider page harus memiliki appbar title Silahkan Pilih Program ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.text('Silahkan Pilih Program'), findsOneWidget);
  });

  testWidgets('decider page harus memiliki 3 gesture detector',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byType(GestureDetector), findsNWidgets(3));
  });
}
