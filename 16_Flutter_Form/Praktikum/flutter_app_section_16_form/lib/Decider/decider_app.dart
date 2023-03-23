import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/AdvanceForm/advance_form_app.dart';
import 'package:flutter_app_section_16_form/AdvanceForm2/advance_form_app2.dart';
import 'package:flutter_app_section_16_form/Decider/decider_page.dart';
import 'package:flutter_app_section_16_form/NewContact/new_contact_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DeciderPage(),
        '/newContact': (context) => const NewContactApp(),
        '/advanceForm': (context) => const AdvanceFormApp(),
        '/advanceForm2': (context) => const AdvanceForm2(),
      },
    );
  }
}
