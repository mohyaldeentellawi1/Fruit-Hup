import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/core/entities/user_entity.dart';
import 'package:fruit_hup/core/errors/failures.dart';
import 'package:fruit_hup/core/models/user_model.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';

class AuthController {
  final FirebaseAuthService authService;

  AuthController({required this.authService});
  Future<Either<Failures, UserEntity>> createUserWithEmail(
    String name,
    String email,
    String password,
  ) async {
    try {
      final user = await authService.createUserWithEmail(
        email: email,
        password: password,
      );
      return right(UserModel.fromJson(user));
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(e.message ?? "An error occurred"));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
