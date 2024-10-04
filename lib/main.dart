import 'package:todo_easy_riverpod_architecture/core/common_providers/sembast_db.dart';
import 'package:todo_easy_riverpod_architecture/core/routing/app_router.dart';
import 'package:todo_easy_riverpod_architecture/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_easy_riverpod_architecture/features/app/presentation/error_screen.dart';
import 'package:todo_easy_riverpod_architecture/features/app/presentation/splash_screen.dart';

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

          final hasData = states.every((state) => state is AsyncData);
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
