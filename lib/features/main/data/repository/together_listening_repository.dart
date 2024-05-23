import 'package:dio/dio.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/main/data/datasource/a_together_listening_datasource.dart';
import 'package:garno_music/features/main/domain/repository/a_together_listening_repository.dart';

class TogetherListeningRepository implements ITogetherListeningRepository {
  final ITogetherListeningDatasource _datasource;

  TogetherListeningRepository(
      {required ITogetherListeningDatasource datasource})
      : _datasource = datasource;

  @override
  Future<ServerResponse<String>> getCode() async {
    try {
      var res = await _datasource.getCode();

      if (res.statusCode == 200) {
        return ServerResponse<String>(
            isSuccess: true, data: res.data, errorMessage: '');
      }
      return ServerResponse<String>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<String>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }
}
