
import 'package:dosh/domain/entities/failure_entity.dart';

class FailureModel extends FailureEntity {
  FailureModel({
    required super.failure,
  });

  factory FailureModel.fromJson(Map<String, dynamic> json) => FailureModel(
        failure: json["failure"],
      );
}
