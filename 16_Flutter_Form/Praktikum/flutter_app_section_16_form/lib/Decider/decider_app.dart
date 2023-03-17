import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/Cupertino/cupertino_app.dart';
import 'package:flutter_app_section_16_form/Decider/decider_page.dart';
import 'package:flutter_app_section_16_form/Ekplorasi/eksplorasi_app.dart';
import 'package:flutter_app_section_16_form/Material/material_app.dart';
import 'package:flutter_app_section_16_form/NewContact/new_contact_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/newContact',
      routes: {
        '/': (context) => const DeciderPage(),
        '/newContact': (context) => const NewContactApp(),
      },
    );
  }
}
