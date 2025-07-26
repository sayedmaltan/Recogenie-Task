import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
UserCredential userCredential;
  LoginSuccess(this.userCredential);
}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
