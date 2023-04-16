import 'package:flutter/cupertino.dart';
import 'package:flutter_app_section_12_praktikum/Cupertino/cupertino_page.dart';

class CupertinoApplication extends StatelessWidget {
  final _themeDark = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null);

  const CupertinoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(theme: _themeDark, home: const CupertinoHomePage());
  }
}
