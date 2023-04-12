import 'package:app_section_25/Services/services.dart';
import 'package:app_section_25/image_bloc/bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        state.images,
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
