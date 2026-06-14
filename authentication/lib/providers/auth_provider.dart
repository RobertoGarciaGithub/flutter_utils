import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:authentication/services/api_service.dart';
import 'package:authentication/services/preferences_service.dart';
import 'package:authentication/repositories/auth_repository.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (ref) async => await SharedPreferences.getInstance(),
);

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).requireValue;
  return PreferencesService(prefs);
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final prefs = ref.watch(preferencesServiceProvider);
  return ApiService(prefs);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(apiServiceProvider);
  return AuthRepository(api);
});
