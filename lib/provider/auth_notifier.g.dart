// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$streamAuthNotifierHash() =>
    r'bd71564d6052966321148fb5ed99b3f7cc5e011a';

/// [認証状態を監視するプロバイダー]
///
/// Copied from [StreamAuthNotifier].
@ProviderFor(StreamAuthNotifier)
final streamAuthNotifierProvider =
    AutoDisposeStreamNotifierProvider<StreamAuthNotifier, User?>.internal(
  StreamAuthNotifier.new,
  name: r'streamAuthNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamAuthNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StreamAuthNotifier = AutoDisposeStreamNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
