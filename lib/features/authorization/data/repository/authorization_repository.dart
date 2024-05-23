import 'package:dio/dio.dart';
import 'package:garno_music/common/models/server_response.dart';

import '../../domain/repository/sign_in_repository.dart';
import '../datasource/a_authorization_datasource.dart';
import '../dto/jwt_token.dart';
import '../dto/user.dart';

class AuthorizationApiRepository implements IAuthorizationRepository {
  AuthorizationApiRepository({required IAuthorizationDatasource datasource})
      : _datasource = datasource;

  final IAuthorizationDatasource _datasource;

  @override
  Future<ServerResponse<JwtTokenDto>> signIn(
      String username, String password) async {
    try {
      var res = await _datasource.signIn(
          UserDto(username: username, password: password, email: username),
          null);

      if (res.statusCode == 200) {
        return ServerResponse<JwtTokenDto>(
            isSuccess: true,
            data: JwtTokenDto.fromJson(res.data),
            errorMessage: '');
      }

      return ServerResponse<JwtTokenDto>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<JwtTokenDto>(
          isSuccess: false, data: null, errorMessage: e.error.toString());
    }
  }

  @override
  Future<ServerResponse<JwtTokenDto>> signUp(
      String username, String email, String password) async {
    try {
      var res = await _datasource.signUp(
          UserDto(username: username, password: password, email: email), null);

      if (res.statusCode == 200) {
        return ServerResponse<JwtTokenDto>(
            isSuccess: true,
            data: JwtTokenDto.fromJson(res.data),
            errorMessage: '');
      }

      return ServerResponse<JwtTokenDto>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<JwtTokenDto>(
          isSuccess: false, data: null, errorMessage: e.message);
    }
    ;
  }
}
