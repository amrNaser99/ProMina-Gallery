import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina/features/home/models/photos_model.dart';
import 'package:promina/features/home/presentation/auth/bloc/auth_cubit.dart';
import 'package:promina/features/home/presentation/bloc/home_state.dart';
import 'package:promina/services/network/end_points.dart';

import '../../../../services/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  PhotosModel? photosModel;
  List photosList = [];

  void getPhotos(BuildContext context) async {
    emit(GetPhotosLoading());
    await DioHelper.getData(
      url: BASE_URL + GALLERY,
      token: AuthCubit.get(context).token,
    ).then((value) {
      photosModel = PhotosModel.fromJson(value.data);
      photosModel?.data?.images?.forEach((element) {
        debugPrint('element: $element');
        photosList.add(element);
      });
      emit(GetPhotosSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPhotosError(error));
    });
  }

  void uploadImage({
    required BuildContext context,
    required File image,
  }) {
    emit(UploadLoading());
    DioHelper.postData(
      url: UPLOAD,
      token: AuthCubit.get(context).token,
      query: {
        'img': image,
      },
    ).then((value) {
      debugPrint('value: $value');

      getPhotos(context);
      emit(UploadSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(UploadError(error));
    });
  }

  final ImagePicker picker = ImagePicker();

  void getImageFromGallery(BuildContext context) async {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      File x = File(value!.path);
      photosList.add(x);
      debugPrint(value.path);

      // uploadImage(context: context, image: x);
      emit(GetImageFromGallerySuccess());
    });
  }
  File? pickedImage ;
  void getImageFromCamera(BuildContext context) async {
    picker.pickImage(source: ImageSource.camera).then((value) {
      pickedImage = File(value!.path);
      photosList.add(pickedImage);
      debugPrint(value.path);

      // uploadImage(context: context, image: pickedImage!);
      emit(GetImageFromCameraSuccess());
    });
  }
}
