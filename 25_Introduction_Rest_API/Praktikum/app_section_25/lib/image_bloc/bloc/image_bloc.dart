import 'package:app_section_25/Services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    final services = Services();

    on<GetImageEvent>((event, emit) async {
      emit(ImageStateLoading());
      try {
        final Response response = await services.fetchImage();

        emit(ImageStateSuccess(response.data.toString()));
      } catch (e) {
        emit(ImageStateError(e.toString()));
      }
    });

    on<GetImageCustomEvent>((event, emit) async {
      emit(ImageInitial());
      try {
        emit(ImageStateLoading());
        final Response response = await services.fetchImageCustom(
          seed: event.url,
        );

        emit(ImageStateSuccess(response.data.toString()));
      } catch (e) {
        emit(ImageStateError(e.toString()));
      }
    });
  }
}
