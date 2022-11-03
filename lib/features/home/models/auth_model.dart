
import 'package:promina/features/home/models/user_model.dart';

class AuthModel {
  final User? user;
  final String? token;

  AuthModel({
    this.user,
    this.token,
  });

  AuthModel.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'token': token};
}
