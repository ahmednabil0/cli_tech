import 'package:dartz/dartz.dart';

import 'package:gradution_project/features/auth/model/api_services/auth_sevices.dart';
import 'package:gradution_project/features/auth/model/models/login_model.dart';

class AuthRepository {
  final AuthApiServices authApiServices;
  AuthRepository({
    required this.authApiServices,
  });
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    final response =
        await authApiServices.login(email: email, password: password);
    return response.fold((errorMessage) {
      return Left(errorMessage);
    }, (data) {
      return Right(LoginModel.fromMap(data));
    });
  }
}
