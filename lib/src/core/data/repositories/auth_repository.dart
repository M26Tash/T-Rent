import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:t_rent/src/core/domain/interfaces/i_auth_repository.dart';

final class AuthRepository implements IAuthRepository {
  final IAuthDataSource _authDataSource;

  const AuthRepository(this._authDataSource);

  @override
  Stream<String?> get signInExceptionMessageStream =>
      _authDataSource.signInExceptionMessageStream;

  @override
  Stream<String?> get registerExceptionMessageStream =>
      _authDataSource.registerExceptionMessageStream;

  @override
  Stream<Session?> get sessionStream => _authDataSource.sessionStream;

  @override
  User? get currentUser => _authDataSource.currentUser;

  @override
  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    return _authDataSource.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> registerWithPassword({
    required String email,
    required String password,
  }) async {
    return _authDataSource.registerWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    return _authDataSource.resetPassword(
      email: email,
    );
  }

  @override
  Future<void> verifyOtpAndPasswd({
    required String email,
    required String password,
    required String otpCode,
  }) async {
    return _authDataSource.verifyOtpAndPasswd(
      email: email,
      password: password,
      otpCode: otpCode,
    );
  }

  @override
  Future<void> signOut() async {
    return _authDataSource.signOut();
  }
}
