import 'package:authentication/models/user.dart';
import 'package:authentication/services/api_service.dart';

class AuthRepository {
  final ApiService _api;

  AuthRepository(this._api);

  Future<User> signIn({required String email, required String password}) async {
    final response = await _api.client.post(
      '/authentication/users/sign_in',
      data: {
        'user': {'email': email, 'password': password},
      },
    );

    final user = User.fromJson(response.data['user']);
    final token = response.data['token'];

    return user.copyWith(token: token);
  }

  Future<User> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _api.client.post(
      '/authentication/users/sign_up',
      data: {
        'user': {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      },
    );

    return User.fromJson(response.data['user']);
  }

  Future<void> signOut() async {
    await _api.client.delete('/authentication/users/sign_out');
  }

  Future<User> getMe() async {
    final response = await _api.client.get('/me');
    return User.fromJson(response.data as Map<String, dynamic>);
  }
}
