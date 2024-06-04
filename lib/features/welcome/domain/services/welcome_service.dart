import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../authorization/domain/services/a_authorization_service.dart';
import 'a_welcome_service.dart';

class WelcomeService implements IWelcomeService {
  final Dio _dio;
  final IAuthorizationService _service;
  WelcomeService(this._service, {required Dio dio}) : _dio = dio;
  @override
  Future<bool> isAuth() async {
    var sp = await SharedPreferences.getInstance();
    var res = sp.getString('token');

    if (res != null && res.isNotEmpty) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $res'});
      await _service.getUser();
      return true;
    }

    return false;
  }
}
