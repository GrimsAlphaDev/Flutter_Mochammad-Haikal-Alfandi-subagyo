import 'package:app_section_28_ui_test/view/screen/decider/decider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'decider screen harus memiliki appbar title Silahkan Pilih Program',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DeciderScreen(),
        ),
      ),
    );

    expect(find.text('Silahkan Pilih Program'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('decider screen harus memiliki 4 gesture detector widget',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DeciderScreen(),
      ),
    ));

    expect(find.byType(GestureDetector), findsNWidgets(4));
  });
}
