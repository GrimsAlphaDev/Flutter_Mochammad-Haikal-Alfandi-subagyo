import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/AdvanceForm/advance_form_page.dart';

class AdvanceFormApp extends StatelessWidget {
  const AdvanceFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdvanceFormPage(),
    );
  }
}
