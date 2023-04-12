import 'package:app_section_26/model/api/image_api.dart';
import 'package:app_section_26/view/screen/image/image_bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageScreen extends StatefulWidget {
  final routename = '/ImageScreen';

  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImageApi service = ImageApi();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ImageBloc>(context).add(GetImageEvent());
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
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                  if (state is ImageStateLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is ImageStateSuccess) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: SvgPicture.string(
                        state.images.toString(),
                      ),
                    );
                  }
                  if (state is ImageStateError) {
                    return Container(
                        height: 200,
                        width: 200,
                        color: Colors.grey,
                        child: Center(
                          child: Text(state.message.toString()),
                        ));
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
