class AppConfig {
  AppConfig._();

  static const apiBaseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000/api/authentication/',
  );

  static const apiTimeout = int.fromEnvironment(
    'API_TIMEOUT',
    defaultValue: 10000,
  );
}
