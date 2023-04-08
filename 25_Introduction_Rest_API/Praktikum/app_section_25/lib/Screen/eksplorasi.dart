import 'package:app_section_25/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Eksplorasi extends StatefulWidget {
  final routename = '/eksplorasi';

  const Eksplorasi({super.key});

  @override
  State<Eksplorasi> createState() => _EksplorasiState();
}

class _EksplorasiState extends State<Eksplorasi> {
  final Services service = Services();
  final _formKey = GlobalKey<FormState>();
  final _seed = TextEditingController();
  late String _svgImage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eksplorasi'),
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
                  'IMAGE GENERATOR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _seed,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _svgImage = '';
                      await service
                          .fetchImageCustom(seed: _seed.text)
                          .then((value) => _svgImage = value.toString());
                      _seed.clear();
                      setState(() {});
                    }
                  },
                  child: const Text('GENERATE'),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_svgImage.isNotEmpty && _svgImage != '')
                  SvgPicture.string(
                    _svgImage,
                    width: 300,
                    placeholderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
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
