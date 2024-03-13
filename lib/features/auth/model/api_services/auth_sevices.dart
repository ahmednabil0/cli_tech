import 'package:dartz/dartz.dart';
import 'package:gradution_project/core/db/api/api_consumer.dart';
import 'package:gradution_project/core/db/api/end_points.dart';
import 'package:gradution_project/core/error/exceptions.dart';
import 'package:gradution_project/core/services/services_locator.dart';

class AuthApiServices {
  Future<Either<String, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      return Right(response);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
