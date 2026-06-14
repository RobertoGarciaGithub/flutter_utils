# Variáveis
BASE_URL_DEV=https://192.168.3.6:3000/api/authentication
BASE_URL_PROD=https://api.meusite.com

# Rodar em desenvolvimento
dev:
	flutter run --dart-define=BASE_URL=$(BASE_URL_DEV) --dart-define=ENV=development

# Rodar em produção
prod:
	flutter run --dart-define=BASE_URL=$(BASE_URL_PROD) --dart-define=ENV=production

# Build APK produção
build-apk:
	flutter build apk --dart-define=BASE_URL=$(BASE_URL_PROD) --dart-define=ENV=production

# Build iOS produção
build-ios:
	flutter build ios --dart-define=BASE_URL=$(BASE_URL_PROD) --dart-define=ENV=production
