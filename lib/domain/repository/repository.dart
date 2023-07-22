import 'package:dartz/dartz.dart';
import 'package:dosh/domain/entities/failure_entity.dart';
import 'package:dosh/domain/entities/todo_entity.dart';

abstract class Repository {
  Future<Either<FailureEntity, List<TodoEntity>>> getData();
}
