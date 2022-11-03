class PhotosModel {
  final String? status;
  final Data? data;
  final String? message;

  PhotosModel({
    this.status,
    this.data,
    this.message,
  });

  PhotosModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() =>
      {'status': status, 'data': data?.toJson(), 'message': message};
}

class Data {
  final List<String>? images;

  Data({
    this.images,
  });

  Data.fromJson(Map<String, dynamic> json)
      : images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {'images': images};
}
