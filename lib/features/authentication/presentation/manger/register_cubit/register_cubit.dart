import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie/features/authentication/data/repos/auth_service_impl.dart';
import 'package:reco_genie/features/authentication/presentation/manger/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthServiceImpl authRepo;

  static RegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());
    var response = await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: '$firstName $lastName',
    );
    response.fold(
      (failure) {
        print("&&&&&&&&&&&&&&&&&&&&&&");
        emit(RegisterFailure(errMessage: failure));
      },
      (registerModel) {
        print("000000000000000000000");
        emit(RegisterSuccess(userCredential: registerModel));
      },
    );
  }
}
