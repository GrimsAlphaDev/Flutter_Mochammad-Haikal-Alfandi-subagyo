import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Cupertino/cupertino_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('cupertino page harus memiliki appbar title CupertinoApp',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CupertinoHomePage())));

    expect(find.text('CupertinoApp'), findsOneWidget);
  });

  testWidgets('Cupertino page harus memiliki text This is CupertinoApp',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CupertinoHomePage())));

    expect(find.text('This is CupertinoApp'), findsOneWidget);
  });
}
