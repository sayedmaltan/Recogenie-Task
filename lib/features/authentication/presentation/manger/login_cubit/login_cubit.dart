import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie/features/authentication/data/repos/auth_service_impl.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthServiceImpl authRepo;

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var response = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    response.fold(
      (failure) {
        emit(LoginFailure(errMessage: 'email or password is incorrect'));
      },
      (userCredential) {
        emit(LoginSuccess(userCredential));
      },
    );
  }
}
