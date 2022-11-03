import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/features/home/presentation/auth/bloc/auth_state.dart';
import 'package:promina/services/network/dio_helper.dart';

import '../../../../../services/network/end_points.dart';
import '../../../models/auth_model.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthModel? authModel;
  String? token ;
  void login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    DioHelper.postData(url: BASE_URL + LOGIN, query: {
      'email': email,
      'password': password,
    }).then((value) {

      authModel = AuthModel.fromJson(value.data);
      token = authModel!.token;
      debugPrint('token: ${authModel!.token}');
      emit(AuthSuccess(authModel));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(AuthError(error));
    });

  }
}
