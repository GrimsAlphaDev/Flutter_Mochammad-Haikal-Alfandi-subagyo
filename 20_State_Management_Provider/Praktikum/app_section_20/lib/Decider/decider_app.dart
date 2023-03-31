import 'package:app_section_20/AdvanceForm/advance_form_app.dart';
import 'package:app_section_20/AdvanceForm2/advance_form_app2.dart';
import 'package:app_section_20/Decider/decider_page.dart';
import 'package:app_section_20/Galeri/galeri_app.dart';
import 'package:app_section_20/NewContact/contacts_with_provider.dart';
import 'package:app_section_20/NewContact/new_contact_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactWithProvider(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
