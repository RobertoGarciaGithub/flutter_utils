import 'dart:convert';

import 'package:authentication/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyBiometricEnabled = 'biometric_enabled';
  static const _keyToken = 'auth_token';
  static const _keyUser = 'current_user';

  final SharedPreferences _prefs;

  PreferencesService(this._prefs);

  bool get isBiometricEnabled => _prefs.getBool(_keyBiometricEnabled) ?? false;

  Future<void> setBiometricEnabled(bool value) async {
    await _prefs.setBool(_keyBiometricEnabled, value);
  }

  Future<void> clearBiometric() async {
    await _prefs.remove(_keyBiometricEnabled);
  }

  String? get token => _prefs.getString(_keyToken);

  Future<void> setToken(String token) async {
    await _prefs.setString(_keyToken, token);
  }

  bool get isTokenExpired {
    final t = token;
    if (t == null) return true;

    try {
      final parts = t.split('.');
      if (parts.length != 3) return false;

      var payload = parts[1];
      payload += '=' * ((4 - payload.length % 4) % 4);

      final decoded = utf8.decode(base64Url.decode(payload));
      final map = jsonDecode(decoded) as Map<String, dynamic>;

      final exp = map['exp'];
      if (exp == null) return false;

      final expiry = DateTime.fromMillisecondsSinceEpoch((exp as int) * 1000);
      return DateTime.now().isAfter(expiry);
    } catch (_) {
      return false;
    }
  }

  bool get isAuthenticated => !isTokenExpired;

  User? get savedUser {
    final json = _prefs.getString(_keyUser);
    if (json == null) return null;
    try {
      return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    await _prefs.setString(_keyUser, jsonEncode(user.toJson()));
  }

  Future<void> clearSession() async {
    await _prefs.remove(_keyToken);
    await _prefs.remove(_keyUser);
    await _prefs.remove(_keyBiometricEnabled);
  }
}
