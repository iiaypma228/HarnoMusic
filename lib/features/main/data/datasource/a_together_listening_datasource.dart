import 'package:dio/dio.dart';

abstract interface class ITogetherListeningDatasource {
  Future<Response> getCode();
}
