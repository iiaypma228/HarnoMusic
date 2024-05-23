import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:garno_music/common/models/json_model.dart';

class ServerResponse<T> {
  ServerResponse(
      {required this.isSuccess,
      required this.data,
      required this.errorMessage});

  final bool isSuccess;
  final T? data;
  final String? errorMessage;

  factory ServerResponse.parseJson(Response response) {
    if (response.statusCode == 200) {
      return ServerResponse<T>(
          isSuccess: true, data: response.data, errorMessage: null);
    }

    return ServerResponse<T>(
      isSuccess: false,
      data: null,
      errorMessage: response.data.toString(),
    );
  }
}
