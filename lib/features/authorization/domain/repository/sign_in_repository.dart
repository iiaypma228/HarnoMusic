import 'package:garno_music/features/profile/domain/models/user.dart';

import '../../../../common/models/server_response.dart';
import '../../data/dto/jwt_token.dart';

abstract interface class IAuthorizationRepository {
  Future<ServerResponse<JwtTokenDto>> signIn(String username, String password);
  Future<ServerResponse<JwtTokenDto>> signUp(
      String username, String email, String password);
  Future<ServerResponse<User>> getUser();
}
