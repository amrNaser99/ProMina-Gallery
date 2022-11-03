
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetPhotosLoading extends HomeStates {}

class GetPhotosSuccess extends HomeStates {}

class GetPhotosError extends HomeStates {
  final String error;

  GetPhotosError(this.error);
}

class UploadLoading extends HomeStates {}

class UploadSuccess extends HomeStates {}

class GetImageFromGallerySuccess extends HomeStates {}

class GetImageFromCameraSuccess extends HomeStates {}

class UploadError extends HomeStates {
  final String error;

  UploadError(this.error);
}
