// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeNotifierHash() => r'e119d56d9bf8b8d7c19624997f99d116098b45e9';

/// `ThemeNotifier` is a `AutoDisposeNotifier` that manages the theme settings
///
/// This was recommended way from the Riverpod documentation. Please refer here if you want more information about the following code.
/// https://riverpod.dev/docs/concepts/why_immutability#using-immutable-state
/// Manages the theme settings and provides methods to [change] the theme.
///
/// Copied from [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeNotifier, ThemeSettings>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = AutoDisposeNotifier<ThemeSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
