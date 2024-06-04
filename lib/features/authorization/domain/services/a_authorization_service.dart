import '../../../../common/models/server_response.dart';

abstract interface class IAuthorizationService {
  Future<ServerResponse<bool>> signIn(String username, String password);
  Future<ServerResponse<bool>> signUp(
      String username, String email, String password);
  Future getUser();
}
