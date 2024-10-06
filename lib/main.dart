import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/core/common_providers/sembast_db.dart';
import 'package:flutter_template/core/routing/app_router.dart';
import 'package:flutter_template/core/themes/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This function is responsible for warming up all the providers that will be needed in the app.
/// We warm up `providers` to ensure that they are [initialized] and ready for use when needed.
///
///
/// For more information about the syntax used in this function, please refer to the YouTube video
/// created by Randal. You can watch the video [here](https://youtu.be/LEk6AWroib8?si=wv-zglB5V2oX3dED).

void main() {
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (((context, ref, child) {
          /// We are loading up the `database provider` here as soon as the application starts.
          final states = [
            ref.watch(sembastDatabaseProvider),
          ];

          /// Check if every state has data.
          final hasData = states.every((state) => state is AsyncData);

          /// Gather list of states that have an error
          final errorStates = states.whereType<AsyncError>();

          return MaterialApp(
            home: errorStates.isNotEmpty
                ? ErrorScreen(
                    onRefresh: () => ref.refresh(sembastDatabaseProvider),
                    error: errorStates.first.error,
                  )
                : hasData
                    ? const MainApp()
                    : const SplashScreen(),
          );
        })),
      ),
    ),
  );
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// We are using the `themeNotifierProvider` to get the [current theme mode].
    final themeSettings = ref.watch(themeNotifierProvider);
    final router = useMemoized(() => AppRouter());
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeSettings.mode,
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    );
  }
}

/// Error screen to catch errors in app.
///
/// Will display a snackbar with the error message and allow user
/// to redirect back to app.
class ErrorScreen extends HookWidget {
  final Object error;
  final VoidCallback onRefresh;

  const ErrorScreen({
    super.key,
    required this.error,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      /// Handle different types of errors here.
      final message = switch (error.runtimeType) {
        const (MissingPluginException) =>
          'Missing plugin: ${(error as MissingPluginException).message}',
        const (PlatformException) =>
          'Platform exception: ${(error as PlatformException).message}',
        _ => error.toString()
      };
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      });
      return null;
    }, [error]);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: onRefresh,
              child: const Text('Refresh app'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Splash screen to show while loading app data.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
