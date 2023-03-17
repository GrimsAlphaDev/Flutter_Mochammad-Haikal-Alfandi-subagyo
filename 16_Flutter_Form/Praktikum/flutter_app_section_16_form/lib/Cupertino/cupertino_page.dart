import 'package:flutter/cupertino.dart';
import 'package:flutter_app_section_16_form/Decider/decider_app.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // get back to previous page
        leading: GestureDetector(
          onTap: () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => const App())),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: const Text('CupertinoApp'),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: const Center(
          child: Text('This is CupertinoApp'),
        ),
      ),
    );
  }
}
