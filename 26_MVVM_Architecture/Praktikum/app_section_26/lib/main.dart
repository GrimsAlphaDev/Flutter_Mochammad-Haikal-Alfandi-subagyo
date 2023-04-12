import 'package:app_section_26/view/screen/contacts/contacs_screen.dart';
import 'package:app_section_26/view/screen/contacts/contacts_bloc/contact_bloc.dart';
import 'package:app_section_26/view/screen/decider/decider_screen.dart';
import 'package:app_section_26/view/screen/image/image_bloc/image_bloc.dart';
import 'package:app_section_26/view/screen/image/image_custom_screen.dart';
import 'package:app_section_26/view/screen/image/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContactBloc(),
          ),
          BlocProvider(
            create: (context) => ImageBloc(),
          )
        ],
        child: const HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        const ContactsScreen().routeName: (context) => const ContactsScreen(),
        const ImageScreen().routename: (context) => const ImageScreen(),
        const ImageCustomScreen().routename: (context) =>
            const ImageCustomScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const DeciderScreen(),
    );
  }
}
