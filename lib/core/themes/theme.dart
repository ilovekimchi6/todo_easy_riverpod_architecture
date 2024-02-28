import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';
part 'theme.g.dart';

/// `ThemeNotifier` is a `AutoDisposeNotifier` that manages the theme settings
///
/// This was recommended way from the Riverpod documentation. Please refer here if you want more information about the following code.
/// https://riverpod.dev/docs/concepts/why_immutability#using-immutable-state

/// Manages the theme settings and provides methods to [change] the theme.

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeSettings build() => const ThemeSettings(
        mode: ThemeMode.light,
        primaryColor: Colors.blue,
      );

  /// Toggles between `light` and `dark` theme modes.
  void toggle() {
    state = state.copyWith(mode: state.mode.toggle);
  }

  /// Sets the theme mode to `dark`.
  void setDarkTheme() {
    state = state.copyWith(mode: ThemeMode.dark);
  }

  /// Sets the theme mode to `light`.
  void setLightTheme() {
    state = state.copyWith(mode: ThemeMode.light);
  }

  /// Sets the theme mode to `system default`.
  void setSystemTheme() {
    state = state.copyWith(mode: ThemeMode.system);
  }

  /// Sets the `primary color` of the theme.
  void setPrimaryColor(Color color) {
    state = state.copyWith(primaryColor: color);
  }
}

/// Represents the [theme settings], including the `mode` and `primary color`.
@freezed
class ThemeSettings with _$ThemeSettings {
  const factory ThemeSettings({
    required ThemeMode mode,
    required Color primaryColor,
  }) = _ThemeSettings;
}

/// [Extension] method to [toggle] between `light` and `dark` theme modes.
extension ToggleTheme on ThemeMode {
  ThemeMode get toggle {
    switch (this) {
      case ThemeMode.dark:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.system:
        return ThemeMode.system;
    }
  }
}

/// Defines the `darkTheme` for the application.
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.deepPurple,
    onPrimary: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle:
          MaterialStateProperty.all(const TextStyle(color: Colors.white)),
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
);

/// Defines the `lightTheme` for the application.
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
);
