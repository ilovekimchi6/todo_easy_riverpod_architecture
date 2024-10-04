import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
