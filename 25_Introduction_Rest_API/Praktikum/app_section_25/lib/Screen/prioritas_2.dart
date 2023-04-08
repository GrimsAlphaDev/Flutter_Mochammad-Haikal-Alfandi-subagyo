import 'package:app_section_25/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Prioritas2 extends StatefulWidget {
  final routename = '/prioritas2';

  const Prioritas2({super.key});

  @override
  State<Prioritas2> createState() => _Prioritas2State();
}

class _Prioritas2State extends State<Prioritas2> {
  final Services service = Services();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prioritas 2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Display Image From API',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SvgPicture.string(
                          snapshot.data.toString(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    future: service.fetchImage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
