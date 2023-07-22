// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureRemoteDatasource() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => RemoteDataSource());
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<Repository>(
        (c) => RepositoryImpl(c<RemoteDataSource>()));
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => UseCase(c<Repository>()));
  }

  @override
  void _configureBloc() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => TodoBloc(c<UseCase>()));
  }
}
