import 'package:app_section_21/NewContact/contacts_with_provider.dart';
import 'package:app_section_21/NewContact/new_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactApp extends StatelessWidget {
  const NewContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactWithProvider(),
        ),
      ],
      child: const NewContactPage(),
    );
  }
}
