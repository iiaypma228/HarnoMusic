import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import 'a_together_listening_datasource.dart';

class TogetherListeningApiDatasource implements ITogetherListeningDatasource {
  final Dio _dio;

  TogetherListeningApiDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<Response> getCode() async {
    return await _dio.get('/api/togetherListening/code');
  }
}
