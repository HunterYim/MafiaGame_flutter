import 'package:mafiagame/models/game_player.dart';

class SpyTeamPlayer extends GamePlayer {
  SpyTeamPlayer({
    required super.name,
    required super.job,
    super.isSpyTeam = true,
    super.team = '간첩 팀',
  });
}

class Spy extends SpyTeamPlayer {
  Spy({
    required super.name,
    super.job = '간첩',
  });
}
