import 'package:app_section_28_ui_test/view/screen/advance_form_2/advance_form_2_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('advance form 2 screen harus memiliki appbar title Contacts ',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceForm2Screen(),
      ),
    ));

    expect(find.text('Contacts'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('advance form 2 screen harus memiliki listview', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceForm2Screen(),
      ),
    ));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('advance form 2 screen harus memiliki 5 textfieldform',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceForm2Screen(),
      ),
    ));

    expect(find.byType(TextFormField), findsNWidgets(5));
  });

  testWidgets('advance form 2 screen harus memiliki 1 elevatedbutton',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AdvanceForm2Screen(),
      ),
    ));

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
