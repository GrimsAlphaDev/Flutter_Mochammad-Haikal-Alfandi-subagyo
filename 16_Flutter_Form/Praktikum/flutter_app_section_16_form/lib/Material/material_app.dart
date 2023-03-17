import 'package:flutter/material.dart';
import 'package:flutter_app_section_16_form/Material/material_page.dart';

class MaterialApplication extends StatelessWidget {
  const MaterialApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MaterialHomePage(),
    );
  }
}
