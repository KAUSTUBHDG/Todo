import 'package:dosh/data/datasource/remote_datasource.dart';
import 'package:dosh/data/repository/repository_impl.dart';
import 'package:dosh/domain/repository/repository.dart';
import 'package:dosh/domain/usecase/usecase.dart';
import 'package:dosh/presentation/screens/bloc/todo_bloc.dart';
import 'package:kiwi/kiwi.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static setup() async {
    final injector = _$InjectorConfig();
    await injector._configure();
  }

  static final resolve = container!.resolve;

  _configure() async {
    _configureBloc();
    _configureUseCases();
    _configureRepositories();
    _configureRemoteDatasource();
  }

  // ============ Register RemoteDatasource ====================
  @Register.factory(RemoteDataSource)
  void _configureRemoteDatasource();

  // ============ Register Repositories ====================
  @Register.factory(Repository, from: RepositoryImpl)
  void _configureRepositories();

  // ============ Register Usecases ====================
  @Register.factory(UseCase)
  void _configureUseCases();

  // =================== BLOC ===========================
  @Register.factory(TodoBloc)
  void _configureBloc();
}
