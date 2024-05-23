import 'package:garno_music/common/models/server_response.dart';

abstract interface class ITogetherListeningRepository {
  Future<ServerResponse<String>> getCode();
}
