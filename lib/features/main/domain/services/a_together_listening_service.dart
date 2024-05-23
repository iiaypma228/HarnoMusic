import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/models/server_response.dart';
import '../models/track.dart';

abstract interface class ITogetherListeningService {
  Future<ServerResponse<String>> getCode();
  Future connectToRoom(String code);
  Future playTogether(Track track);
  void stopPlaying();
  void resumePlaying();
  bool isConnected();
  Stream<String> get onNewJoined;
  Stream<String> get onStartPlaying;
  Stream<String> get onPausePlaying;
  Stream<String> get onResumePlaying;
}
