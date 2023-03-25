import 'package:app_section_17_assets/AdvanceForm/advance_form_app.dart';
import 'package:app_section_17_assets/AdvanceForm2/advance_form_app2.dart';
import 'package:app_section_17_assets/Decider/decider_page.dart';
import 'package:app_section_17_assets/Galeri/galeri_app.dart';
import 'package:app_section_17_assets/NewContact/new_contact_app.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const DeciderPage(),
        '/newContact': (context) => const NewContactApp(),
        '/advanceForm': (context) => const AdvanceFormApp(),
        '/advanceForm2': (context) => const AdvanceForm2(),
        '/galeri': (context) => const GaleriApp(),
      },
    );
  }
}
