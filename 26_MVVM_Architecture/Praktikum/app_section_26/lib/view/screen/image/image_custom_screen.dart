import 'package:app_section_26/model/api/image_api.dart';
import 'package:app_section_26/view/screen/image/image_bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageCustomScreen extends StatefulWidget {
  final routename = '/ImageCustomScreen';

  const ImageCustomScreen({super.key});

  @override
  State<ImageCustomScreen> createState() => _ImageCustomScreenState();
}

class _ImageCustomScreenState extends State<ImageCustomScreen> {
  final ImageApi service = ImageApi();
  final _formKey = GlobalKey<FormState>();
  final _seed = TextEditingController();

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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ImageBloc>().add(
                            GetImageCustomEvent(url: _seed.text),
                          );
                    }
                  },
                  child: const Text('GENERATE'),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                  if (state is ImageInitial) {
                    return Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                      child: const Center(
                        child: Text('No Image'),
                      ),
                    );
                  }
                  if (state is ImageStateLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is ImageCustomStateSuccess) {
                    if (state.images != null) {
                      return SizedBox(
                        height: 200,
                        width: 200,
                        child: SvgPicture.string(
                          state.images.toString(),
                          fit: BoxFit.fill,
                        ),
                      );
                    }
                  }

                  return Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                    child: const Center(
                      child: Text('No Image'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}