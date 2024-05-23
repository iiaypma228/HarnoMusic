import 'package:dio/dio.dart';

import '../dto/user.dart';

abstract interface class IAuthorizationDatasource {
  Future<Response> signIn(UserDto dto, int? tokenLifitime);
  Future<Response> signUp(UserDto dto, int? tokenLifitime);
}
