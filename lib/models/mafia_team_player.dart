import 'package:mafiagame/models/game_player.dart';

class MafiaTeamPlayer extends GamePlayer {
  MafiaTeamPlayer({
    required super.name,
    required super.job,
    super.isSpyTeam = false,
    super.team = '마피아 팀',
  });
}

class Mafia extends MafiaTeamPlayer {
  Mafia({
    required super.name,
    super.job = '마피아',
  });
}

class WereWolf extends MafiaTeamPlayer {
  WereWolf({
    required super.name,
    super.job = '늑대인간',
  });
}

class ShadowMan extends MafiaTeamPlayer {
  ShadowMan({
    required super.name,
    super.job = '그림자',
  });
}
