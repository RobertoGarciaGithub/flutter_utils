import 'package:flutter/material.dart';
import 'package:authentication/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication/providers/local_auth_provider.dart';

class AuthCheck extends ConsumerStatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends ConsumerState<AuthCheck> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLocalAuth();
    });
  }

  Future<void> checkLocalAuth() async {
    try {
      final auth = ref.read(localAuthProvider);

      final isLocalAuthAvailable = await auth.isBiometricAvailable();

      if (!mounted) return;

      isLocalAuthFailed.value = false;

      if (isLocalAuthAvailable) {
        final isAuthenticated = await auth.authenticate();

        if (!mounted) return;

        if (isAuthenticated) {
          Routes.navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.initial,
            (route) => false,
          );
        } else {
          isLocalAuthFailed.value = true;
        }
      } else {
        Routes.to.pushReplacementNamed(Routes.initial);
      }
    } catch (e) {
      if (!mounted) return;

      isLocalAuthFailed.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: isLocalAuthFailed,
          builder: (context, failed, _) {
            if (!failed) {
              return const CircularProgressIndicator();
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.fingerprint, size: 64),
                const SizedBox(height: 16),
                const Text(
                  'Falha na autenticação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Tente novamente para continuar'),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    isLocalAuthFailed.value = false;
                    checkLocalAuth();
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
