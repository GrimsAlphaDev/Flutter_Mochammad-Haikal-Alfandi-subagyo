import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Material/material_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('material page harus memiliki appbar ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MaterialHomePage())));

    expect(find.text('MaterialApp'), findsOneWidget);
  });

  testWidgets('material page harus memiliki 2 listview',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MaterialHomePage())));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('material page harus memiliki 7 listtile',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MaterialHomePage())));

    expect(find.byType(ListTile), findsNWidgets(7));
  });

  testWidgets('material page harus memiliki 1 floating action button',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MaterialHomePage())));

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
