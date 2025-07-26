

import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState{}

class RegisterInitial extends RegisterState{}

class RegisterLoading extends RegisterState{}

class RegisterSuccess extends RegisterState{
  UserCredential userCredential;
  RegisterSuccess({required this.userCredential});
}

class RegisterFailure extends RegisterState{
  final String errMessage;
  RegisterFailure({required this.errMessage});
}

