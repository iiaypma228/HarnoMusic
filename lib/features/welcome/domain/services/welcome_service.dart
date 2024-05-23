import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'a_welcome_service.dart';

class WelcomeService implements IWelcomeService {
  final Dio _dio;

  WelcomeService({required Dio dio}) : _dio = dio;
  @override
  Future<bool> isAuth() async {
    var sp = await SharedPreferences.getInstance();
    var res = sp.getString('token');

    if (res != null && res.isNotEmpty) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $res'});
      return true;
    }

    return false;
  }
}
