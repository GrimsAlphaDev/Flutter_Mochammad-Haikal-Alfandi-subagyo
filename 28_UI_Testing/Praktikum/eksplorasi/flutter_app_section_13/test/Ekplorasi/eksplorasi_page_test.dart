import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Ekplorasi/eksplorasi_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('eksplorasi page harus memiliki appbar title My Flutter App',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: EksplorasiHome())));

    expect(find.text('My Flutter App'), findsOneWidget);
  });

  testWidgets('eksplorasi page harus memiliki listview',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: EksplorasiHome())));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('eksplorasi page harus memiliki bottom navigation bar',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: EksplorasiHome())));

    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('eksplorasi page harus memiliki 3 listtile',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: EksplorasiHome())));

    expect(find.byType(ListTile), findsNWidgets(7));
  });
}
