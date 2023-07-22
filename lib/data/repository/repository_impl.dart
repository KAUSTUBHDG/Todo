import 'package:dartz/dartz.dart';
import 'package:dosh/data/datasource/remote_datasource.dart';
import 'package:dosh/domain/entities/failure_entity.dart';
import 'package:dosh/domain/entities/todo_entity.dart';
import 'package:dosh/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<FailureEntity, List<TodoEntity>>> getData() async {
    return _remoteDataSource.getData();
  }
}
