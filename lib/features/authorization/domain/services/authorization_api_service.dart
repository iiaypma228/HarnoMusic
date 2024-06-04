import 'package:dio/dio.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/authorization/domain/repository/sign_in_repository.dart';
import 'package:garno_music/features/authorization/domain/services/a_authorization_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../profile/domain/models/user.dart';

class AuthorizationService implements IAuthorizationService {
  static const String _bearerTokenKey = 'token';
  static User? currentUser;

  final IAuthorizationRepository _repository;
  final Dio _dio;

  AuthorizationService(this._dio,
      {required IAuthorizationRepository repository})
      : _repository = repository;

  @override
  Future<ServerResponse<bool>> signIn(String username, String password) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    var res = await _repository.signIn(username, password);

    if (res.isSuccess) {
      sharedPreferences.setString(_bearerTokenKey, res.data!.access_token);
      _dio.options.headers
          .addAll({'Authorization': 'Bearer ${res.data!.access_token}'});

      Future.microtask(getUser);

      return ServerResponse<bool>(
          isSuccess: true, data: true, errorMessage: '');
    }

    return ServerResponse<bool>(
        isSuccess: false, data: false, errorMessage: res.errorMessage);
  }

  @override
  Future<ServerResponse<bool>> signUp(
      String username, String email, String password) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    var res = await _repository.signUp(username, email, password);

    if (res.isSuccess) {
      sharedPreferences.setString(_bearerTokenKey, res.data!.access_token);
      _dio.options.headers
          .addAll({'Authorization': 'Bearer ${res.data!.access_token}'});

      Future.microtask(getUser);

      return ServerResponse<bool>(
          isSuccess: true, data: true, errorMessage: '');
    }
    return ServerResponse<bool>(
        isSuccess: false, data: false, errorMessage: res.errorMessage);
  }

  @override
  Future getUser() async {
    var user = await _repository.getUser();
    if (user.isSuccess) {
      currentUser = user.data;
    }
  }
}
