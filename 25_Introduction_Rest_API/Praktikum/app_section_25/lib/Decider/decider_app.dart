import 'package:app_section_25/decider/decider_page.dart';
import 'package:app_section_25/Screen/eksplorasi.dart';
import 'package:app_section_25/Screen/prioritas_1.dart';
import 'package:app_section_25/Screen/prioritas_2.dart';
import 'package:flutter/material.dart';

class DeciderApp extends StatelessWidget {
  const DeciderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: const DeciderPage().routeName,
      routes: {
        const Prioritas1().routeName: (context) => const Prioritas1(),
        const Prioritas2().routename: (context) => const Prioritas2(),
        const Eksplorasi().routename: (context) => const Eksplorasi(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const DeciderPage(),
    );
  }
}
