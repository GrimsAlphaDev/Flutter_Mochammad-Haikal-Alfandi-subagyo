import 'package:app_section_28_ui_test/view/screen/advance_form/advance_form_screen.dart';
import 'package:app_section_28_ui_test/view/screen/advance_form_2/advance_form_2_screen.dart';
import 'package:app_section_28_ui_test/view/screen/contact/contact_screen.dart';
import 'package:app_section_28_ui_test/view/screen/decider/decider_screen.dart';
import 'package:app_section_28_ui_test/view/screen/halaman_belum_pernah_dibuat/halaman_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      routes: {
        AdvanceFormScreen.routeName: (context) => const AdvanceFormScreen(),
        AdvanceForm2Screen.routeName: (context) => const AdvanceForm2Screen(),
        ContactScreen.routeName: (context) => const ContactScreen(),
        DeciderScreen.routeName: (context) => const DeciderScreen(),
        HalamanScreen.routeName: (context) => const HalamanScreen(),
      },
      initialRoute: DeciderScreen.routeName,
    );
  }
}
