import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/models/server_response.dart';
import '../../../profile/domain/models/user.dart';
import '../models/track.dart';

abstract interface class ITogetherListeningService {
  Stream<User> get onNewJoined;
  Stream<String> get onStartPlaying;
  Stream<String> get onPausePlaying;
  Stream<String> get onResumePlaying;
  Stream<String> get onDisconnectedUser;
  Stream get onDisconnected;
  bool get isMaintainer;
  String getCode();
  List<User> getUsers();
  Future<String> createRoom();
  Future<(bool isSuccses, String error)> connectToRoom(String code);
  Future disconnectFromRoom();
  Future playTogether(Track track);
  Future stopPlaying();
  Future resumePlaying();
  bool isConnected();
}
