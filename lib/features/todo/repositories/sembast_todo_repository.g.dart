// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sembast_todo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sembastRepositoryHash() => r'72c8ca54853f2cd0800867d8ba7e205b75e3fe85';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SembastRepository
    extends BuildlessAutoDisposeStreamNotifier<List<Todo>> {
  late final Database database;

  Stream<List<Todo>> build(
    Database database,
  );
}

/// See also [SembastRepository].
@ProviderFor(SembastRepository)
const sembastRepositoryProvider = SembastRepositoryFamily();

/// See also [SembastRepository].
class SembastRepositoryFamily extends Family<AsyncValue<List<Todo>>> {
  /// See also [SembastRepository].
  const SembastRepositoryFamily();

  /// See also [SembastRepository].
  SembastRepositoryProvider call(
    Database database,
  ) {
    return SembastRepositoryProvider(
      database,
    );
  }

  @override
  SembastRepositoryProvider getProviderOverride(
    covariant SembastRepositoryProvider provider,
  ) {
    return call(
      provider.database,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sembastRepositoryProvider';
}

/// See also [SembastRepository].
class SembastRepositoryProvider extends AutoDisposeStreamNotifierProviderImpl<
    SembastRepository, List<Todo>> {
  /// See also [SembastRepository].
  SembastRepositoryProvider(
    Database database,
  ) : this._internal(
          () => SembastRepository()..database = database,
          from: sembastRepositoryProvider,
          name: r'sembastRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sembastRepositoryHash,
          dependencies: SembastRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SembastRepositoryFamily._allTransitiveDependencies,
          database: database,
        );

  SembastRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
  }) : super.internal();

  final Database database;

  @override
  Stream<List<Todo>> runNotifierBuild(
    covariant SembastRepository notifier,
  ) {
    return notifier.build(
      database,
    );
  }

  @override
  Override overrideWith(SembastRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: SembastRepositoryProvider._internal(
        () => create()..database = database,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<SembastRepository, List<Todo>>
      createElement() {
    return _SembastRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SembastRepositoryProvider && other.database == database;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SembastRepositoryRef on AutoDisposeStreamNotifierProviderRef<List<Todo>> {
  /// The parameter `database` of this provider.
  Database get database;
}

class _SembastRepositoryProviderElement
    extends AutoDisposeStreamNotifierProviderElement<SembastRepository,
        List<Todo>> with SembastRepositoryRef {
  _SembastRepositoryProviderElement(super.provider);

  @override
  Database get database => (origin as SembastRepositoryProvider).database;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
