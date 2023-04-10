part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class GetImageEvent extends ImageEvent {}

class GetImageCustomEvent extends ImageEvent {
  final String url;

  GetImageCustomEvent({required this.url});
}

