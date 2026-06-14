import 'package:dio/dio.dart';
import 'package:authentication/config/app_config.dart';
import 'package:authentication/routes/routes.dart';
import 'package:authentication/services/preferences_service.dart';

class ApiService {
  static const _baseUrl = AppConfig.apiBaseUrl;

  final Dio _dio;
  final PreferencesService _prefs;

  ApiService(this._prefs) : _dio = Dio(_baseOptions()) {
    _dio.interceptors.add(_authInterceptor());
  }

  Dio get client => _dio;

  static BaseOptions _baseOptions() => BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
    receiveTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  InterceptorsWrapper _authInterceptor() => InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = _prefs.token;
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
    onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        await _prefs.clearSession();
        Routes.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          Routes.signIn,
          (route) => false,
        );
      }
      handler.next(error);
    },
  );
}
