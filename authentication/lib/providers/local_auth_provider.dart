import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication/services/local_auth_service.dart';
import 'package:local_auth/local_auth.dart';

final localAuthProvider = Provider<LocalAuthService>((ref) {
  return LocalAuthService(auth: LocalAuthentication());
});
