import 'package:flutter/material.dart';
import 'package:flutter_app_section_12_praktikum/Cupertino/cupertino_app.dart';
import 'package:flutter_app_section_12_praktikum/Decider/decider_page.dart';
import 'package:flutter_app_section_12_praktikum/Ekplorasi/eksplorasi_app.dart';
import 'package:flutter_app_section_12_praktikum/Material/material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DeciderPage(),
        '/material': (context) => const MaterialApplication(),
        '/cupertino': (context) => const CupertinoApplication(),
        '/eksplorasi': (context) => const EksplorasiApp(),
      },
    );
  }
}
