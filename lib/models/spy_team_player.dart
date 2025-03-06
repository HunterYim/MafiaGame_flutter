import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class SpyTeamPlayer extends GamePlayer {
  SpyTeamPlayer({
    required super.name,
    required super.job,
    required super.jobIcon,
    super.isSpyTeam = true,
    super.team = '간첩 팀',
    required super.abilityText,
  });
}

class Spy extends SpyTeamPlayer {
  Spy({
    required super.name,
    super.job = '간첩',
    super.abilityText = '포섭할 대상 선택',
    super.jobIcon = FontAwesomeIcons.masksTheater,
  });
}
