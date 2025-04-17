import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/controllers/auth_controller.dart';
import 'package:fruit_hup/cubit/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authController) : super(SignupInitial());

  final AuthController authController;

  Future<void> createUser(String name, String email, String password) async {
    emit(SignupLoading());
    final result = await authController.createUserWithEmail(
      name,
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignupFailure(error: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}
