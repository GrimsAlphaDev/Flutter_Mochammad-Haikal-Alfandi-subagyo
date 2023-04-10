part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageStateLoading extends ImageState {}

class ImageStateSuccess extends ImageState {
  final dynamic images;

  ImageStateSuccess(this.images);
}

class ImageStateError extends ImageState {
  final String message;

  ImageStateError(this.message);
}
