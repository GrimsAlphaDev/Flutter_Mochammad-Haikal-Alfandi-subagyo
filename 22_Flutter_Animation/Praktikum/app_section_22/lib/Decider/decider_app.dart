import 'package:app_section_22/AdvanceForm2/ContactBloc/bloc/contacts_bloc.dart';
import 'package:app_section_22/Decider/decider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AdvanceForm/advance_form_app.dart';
import '../AdvanceForm2/advance_form_app2.dart';
import '../Galeri/galeri_app.dart';
import '../NewContact/new_contact_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsBloc(),
        )
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
