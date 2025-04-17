import 'package:fruit_hup/controllers/auth_controller.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthController>(
    AuthController(authService: getIt<FirebaseAuthService>()),
  );
}
