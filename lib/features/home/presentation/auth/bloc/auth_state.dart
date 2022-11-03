
import '../../../models/auth_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel? authModel;

  AuthSuccess(this.authModel);
}
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}

