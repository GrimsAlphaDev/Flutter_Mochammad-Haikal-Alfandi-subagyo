import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/NewContact/new_contact_page.dart';

class NewContactApp extends StatelessWidget {
  const NewContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NewContactPage(),
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
