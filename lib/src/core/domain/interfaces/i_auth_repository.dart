import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IAuthRepository {
  Stream<String?> get signInExceptionMessageStream;

  Stream<String?> get registerExceptionMessageStream;

  Stream<Session?> get sessionStream;

  User? get currentUser;

  Future<void> signInWithPassword({
    required String email,
    required String password,
  });

  Future<void> registerWithPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
