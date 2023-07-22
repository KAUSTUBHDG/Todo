import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dosh/constants/constants.dart';
import 'package:dosh/data/model/todo_model.dart';
import 'package:dosh/domain/entities/failure_entity.dart';
import 'package:dosh/domain/entities/todo_entity.dart';

class RemoteDataSource {
  final Dio _dio = Dio();

  Future<Either<FailureEntity, List<TodoEntity>>> getData() async {
    try {
      final response = await _dio.get(Constants.url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<TodoEntity> todoEntities =
            responseData.map((json) => TodoModel.fromJson(json)).toList();
        return Right(todoEntities);
      } else {
        final failureEntity = FailureEntity(failure: "Failed to get data");
        return Left(failureEntity);
      }
    } catch (error) {
      final failureEntity = FailureEntity(failure: "An error occurred: $error");
      return Left(failureEntity);
    }
  }
}
