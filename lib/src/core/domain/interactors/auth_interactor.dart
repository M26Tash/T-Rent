import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/core/domain/interfaces/i_auth_repository.dart';

final class AuthInteractor {
  final IAuthRepository _authRepository;

  const AuthInteractor(this._authRepository);

  Stream<String?> get signInExceptionMessageStream =>
      _authRepository.signInExceptionMessageStream;

  Stream<String?> get registerExceptionMessageStream =>
      _authRepository.registerExceptionMessageStream;

  Stream<Session?> get sessionStream => _authRepository.sessionStream;

  User? get currentUser => _authRepository.currentUser;

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    return _authRepository.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> registerWithPassword({
    required String email,
    required String password,
  }) async {
    return _authRepository.registerWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }

  // Future<void> resetPassword({
  //   required String email,
  // }) async {
  //   return _authRepository.resetPassword(
  //     email: email,
  //   );
  // }
}
