import 'package:app_section_27/view/screen/decider/decider_screen.dart';
import 'package:app_section_27/view/screen/prioritas_1/prioritas_1_screen.dart';
import 'package:app_section_27/view/screen/prioritas_1/prioritas_1_view_model.dart';
import 'package:app_section_27/view/screen/prioritas_2/prioritas_2_screen.dart';
import 'package:app_section_27/view/screen/prioritas_2/prioritas_2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Prioritas1ViewModel()),
          ChangeNotifierProvider(create: (_) => Prioritas2ViewModel()),
        ],
        child: const HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: DeciderScreen.routeName,
      routes: {
        DeciderScreen.routeName: (context) => const DeciderScreen(),
        Prioritas1Screen.routeName: (context) => const Prioritas1Screen(),
        Prioritas2Screen.routeName: (context) => const Prioritas2Screen(),
      },
    );
  }
}
