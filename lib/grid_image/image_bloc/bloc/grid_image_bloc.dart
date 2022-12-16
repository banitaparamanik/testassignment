import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testassignment/grid_image/model/grid_image_data_model.dart';
import 'package:testassignment/grid_image/repository/image_repository.dart';
import 'package:testassignment/utils/custom_exception.dart';

part 'grid_image_event.dart';
part 'grid_image_state.dart';

class GridImageBloc extends Bloc<GridImageEvent, GridImageState> {
  GridImageBloc(this.imageRepository) : super(GridImageInitial()) {
   on<FetchImageInitial>(_onFetchImageInitial);
  }
  final ImageRepository imageRepository;


    FutureOr<void> _onFetchImageInitial(
      FetchImageInitial event, Emitter<GridImageState> emit) async {
    try {
      emit(FetchImageInPregress());
    List<dynamic> data = await imageRepository.fetchImage();
        List<GridImageDataModel> imageList =
            List<GridImageDataModel>.from(data.map((e) => GridImageDataModel.fromJson(e)));
        // for (int i = 0; i < countryList.length; i++) {
        //   Map<String, dynamic> countryData = countryList[i].toDataMap();
        //   await countryRepository.insertCountry(countryData);
        // }
        // countryList.sort((a, b) => a.commonName != null
        //     ? a.commonName!.compareTo(b.commonName ?? '')
        //     : 1);
        emit(ImageListSuccessState(imageList));
    } on AppException catch (e) {
      emit(ImageListFailureState(e));
    } catch (_) {
      emit(ImageListFailureState(AppException(
          exceptionType: ExceptionType.general, message: "Try Again")));
    }
  }
}




