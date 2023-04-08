import 'package:app_section_23/AdvanceForm2/advance_form_page2.dart';
import 'package:app_section_23/Decider/decider_page.dart';
import 'package:app_section_23/Login/login_app.dart';
import 'package:flutter/material.dart';
import '../AdvanceForm/advance_form_app.dart';
import '../AdvanceForm2/advance_form_app2.dart';
import '../Galeri/galeri_app.dart';
import '../NewContact/new_contact_app.dart';

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
        '/advanceForm2page': (context) => const AdvanceFormPage2(),
        '/galeri': (context) => const GaleriApp(),
        '/loginForm': (context) => const LoginApp(),
      },
    );
  }
}
