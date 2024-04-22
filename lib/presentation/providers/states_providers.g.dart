// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'a2a7cfb92852966a991f3cad09b70bd110b84063';

/// See also [Counter].
@ProviderFor(Counter)
final counterProvider = NotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = Notifier<int>;
String _$darKModeHash() => r'37432dd542b7009b106b9f1a5de1ac6149aef5da';

/// See also [DarKMode].
@ProviderFor(DarKMode)
final darKModeProvider = AutoDisposeNotifierProvider<DarKMode, bool>.internal(
  DarKMode.new,
  name: r'darKModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$darKModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DarKMode = AutoDisposeNotifier<bool>;
String _$userNameHash() => r'71808101d2af90a245edcf8f35ce83f76c363ee4';

/// See also [UserName].
@ProviderFor(UserName)
final userNameProvider = AutoDisposeNotifierProvider<UserName, String>.internal(
  UserName.new,
  name: r'userNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserName = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
