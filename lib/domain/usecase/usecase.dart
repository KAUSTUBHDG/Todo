import 'package:dartz/dartz.dart';
import 'package:dosh/domain/entities/failure_entity.dart';
import 'package:dosh/domain/entities/todo_entity.dart';
import 'package:dosh/domain/repository/repository.dart';

class UseCase {
  final Repository _repository;
  UseCase(this._repository);
  Future<Either<FailureEntity, List<TodoEntity>>> getData() async {
    return _repository.getData();
  }
}
