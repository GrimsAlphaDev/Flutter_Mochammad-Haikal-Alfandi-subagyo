import 'package:app_section_28_ui_test/view/screen/contact/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Judul Halaman Harus Create New Contacts', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ContactScreen(),
      ),
    ));

    expect(find.text('Create New Contacts'), findsOneWidget);
  });

  testWidgets('Halaman Contacts Harus Memiliki 2 Inputan', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ContactScreen(),
      ),
    ));

    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets('Halaman Contacts Harus Memiliki 1 Tombol', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ContactScreen(),
      ),
    ));

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Halaman Contacts Harus Memiliki List Contact', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ContactScreen(),
      ),
    ));

    expect(find.byType(ListView), findsOneWidget);
  });
}
