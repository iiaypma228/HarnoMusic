import 'dart:convert';

import 'package:dio/dio.dart';
import '../dto/user.dart';
import 'a_authorization_datasource.dart';

class AuthorizationApiDatasource implements IAuthorizationDatasource {
  AuthorizationApiDatasource({required Dio dio}) : _dio = dio;

  final Dio _dio;
  @override
  Future<Response<dynamic>> signIn(UserDto dto, int? tokenLifitime) async {
    return await _dio.post('/api/auth',
        data: jsonEncode(dto.toJson()),
        queryParameters: {'tokenlifitime': tokenLifitime ?? 60 * 1500});
  }

  @override
  Future<Response> signUp(UserDto dto, int? tokenLifitime) async {
    return await _dio.post('/api/register',
        data: jsonEncode(dto.toJson()),
        queryParameters: {'tokenlifitime': tokenLifitime ?? 60 * 1500});
  }
}
