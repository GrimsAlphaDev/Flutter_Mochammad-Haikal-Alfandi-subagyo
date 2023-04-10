import 'package:app_section_25/contact_bloc/bloc/contact_bloc.dart';
import 'package:app_section_25/decider/decider_app.dart';
import 'package:app_section_25/image_bloc/bloc/image_bloc.dart';
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
        child: const DeciderApp(),
      ),
    );
