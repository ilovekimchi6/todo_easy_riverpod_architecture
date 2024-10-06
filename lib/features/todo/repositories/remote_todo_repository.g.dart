// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_todo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteRepositoryHash() => r'676904692733ff678a252660343b1ef253ec08c3';

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

abstract class _$RemoteRepository
    extends BuildlessAutoDisposeStreamNotifier<List<Todo>> {
  late final Database database;

  Stream<List<Todo>> build(
    Database database,
  );
}

/// This class represents a [remote repository] for `managing` todo data.
/// NOTE: It has not been implemented yet.
///
/// Copied from [RemoteRepository].
@ProviderFor(RemoteRepository)
const remoteRepositoryProvider = RemoteRepositoryFamily();

/// This class represents a [remote repository] for `managing` todo data.
/// NOTE: It has not been implemented yet.
///
/// Copied from [RemoteRepository].
class RemoteRepositoryFamily extends Family<AsyncValue<List<Todo>>> {
  /// This class represents a [remote repository] for `managing` todo data.
  /// NOTE: It has not been implemented yet.
  ///
  /// Copied from [RemoteRepository].
  const RemoteRepositoryFamily();

  /// This class represents a [remote repository] for `managing` todo data.
  /// NOTE: It has not been implemented yet.
  ///
  /// Copied from [RemoteRepository].
  RemoteRepositoryProvider call(
    Database database,
  ) {
    return RemoteRepositoryProvider(
      database,
    );
  }

  @override
  RemoteRepositoryProvider getProviderOverride(
    covariant RemoteRepositoryProvider provider,
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
  String? get name => r'remoteRepositoryProvider';
}

/// This class represents a [remote repository] for `managing` todo data.
/// NOTE: It has not been implemented yet.
///
/// Copied from [RemoteRepository].
class RemoteRepositoryProvider extends AutoDisposeStreamNotifierProviderImpl<
    RemoteRepository, List<Todo>> {
  /// This class represents a [remote repository] for `managing` todo data.
  /// NOTE: It has not been implemented yet.
  ///
  /// Copied from [RemoteRepository].
  RemoteRepositoryProvider(
    Database database,
  ) : this._internal(
          () => RemoteRepository()..database = database,
          from: remoteRepositoryProvider,
          name: r'remoteRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$remoteRepositoryHash,
          dependencies: RemoteRepositoryFamily._dependencies,
          allTransitiveDependencies:
              RemoteRepositoryFamily._allTransitiveDependencies,
          database: database,
        );

  RemoteRepositoryProvider._internal(
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
    covariant RemoteRepository notifier,
  ) {
    return notifier.build(
      database,
    );
  }

  @override
  Override overrideWith(RemoteRepository Function() create) {
    return ProviderOverride(
      origin: this,
      override: RemoteRepositoryProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<RemoteRepository, List<Todo>>
      createElement() {
    return _RemoteRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteRepositoryProvider && other.database == database;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoteRepositoryRef on AutoDisposeStreamNotifierProviderRef<List<Todo>> {
  /// The parameter `database` of this provider.
  Database get database;
}

class _RemoteRepositoryProviderElement
    extends AutoDisposeStreamNotifierProviderElement<RemoteRepository,
        List<Todo>> with RemoteRepositoryRef {
  _RemoteRepositoryProviderElement(super.provider);

  @override
  Database get database => (origin as RemoteRepositoryProvider).database;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
