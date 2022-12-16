part of 'grid_image_bloc.dart';

abstract class GridImageState {}

class GridImageInitial extends GridImageState {}

class FetchImageInPregress extends GridImageState {}

class ImageListSuccessState extends GridImageState {
  List<GridImageDataModel> imageList;

  ImageListSuccessState(this.imageList);
}

class ImageListFailureState extends GridImageState {
  final AppException appException;

  ImageListFailureState(this.appException);
}
