import 'package:app_section_28_ui_test/view/screen/advance_form/advance_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'advance form screen harus memiliki Appbar title Interactive Widget dan center title true',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceFormScreen(),
      ),
    ));

    expect(find.text('Interactive Widgets'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('advance form screen harus memiliki listview', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceFormScreen(),
      ),
    ));

    expect(find.byType(ListView), findsOneWidget);
  });
}
