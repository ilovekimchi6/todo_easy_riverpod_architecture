import 'package:todo_easy_riverpod_architecture/core/common_providers/sembast_db.dart';
import 'package:todo_easy_riverpod_architecture/core/routing/app_router.dart';
import 'package:todo_easy_riverpod_architecture/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//We warm up all the providers we will need in the app
//Please refer to this youtube video made my Randal for more information about the syntax
//https://youtu.be/LEk6AWroib8?si=wv-zglB5V2oX3dED

void main() {
  runApp(ProviderScope(child: Consumer(
    builder: (((context, ref, child) {
      //We are loading up the database provider here as soon as the application starts.
      final states = [
        ref.watch(sembastDatabaseProvider),
      ];

      if (states.every((state) => state is AsyncData)) {
        return const MaterialApp(home: MainApp());
      }

      if (states.any((state) => state is AsyncError)) {
        return const Center(child: Text('Error'));
      }

      return const Center(child: CircularProgressIndicator());
    })),
  )));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
//We are using the themeNotifierProvider to get the current theme mode
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
