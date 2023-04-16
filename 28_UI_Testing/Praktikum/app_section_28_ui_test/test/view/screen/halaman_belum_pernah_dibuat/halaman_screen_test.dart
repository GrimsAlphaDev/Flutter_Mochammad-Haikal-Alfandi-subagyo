import 'package:app_section_28_ui_test/view/screen/halaman_belum_pernah_dibuat/halaman_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('halaman screen harus memiliki titile appbar Contacts Form',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HalamanScreen(),
      ),
    ));

    expect(find.text('Contacts Form'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('halaman screen harus memiliki listview', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HalamanScreen(),
      ),
    ));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('halaman screen harus memiliki 3 textfieldform', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HalamanScreen(),
      ),
    ));

    expect(find.byType(TextFormField), findsNWidgets(3));
  });

  testWidgets('halaman screen harus memiliki 1 elevatedbutton', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HalamanScreen(),
      ),
    ));

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
