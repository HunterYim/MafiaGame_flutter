import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class MafiaTeamPlayer extends GamePlayer {
  MafiaTeamPlayer({
    required super.name,
    required super.job,
    required super.abilityText,
    required super.jobIcon,
    super.isSpyTeam = false,
    super.team = '마피아 팀',
  });
}

class Mafia extends MafiaTeamPlayer {
  static const IconData icon = IconData(
    0xF0703,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );
  Mafia({
    required super.name,
    super.job = '마피아',
    super.abilityText = '공격할 대상을 선택하세요',
    super.jobIcon = icon,
  });
}

class WereWolf extends MafiaTeamPlayer {
  WereWolf({
    required super.name,
    super.job = '늑대인간',
    super.abilityText = ' 대상을 선택하세요',
    super.jobIcon = FontAwesomeIcons.wolfPackBattalion,
  });
}

class ShadowMan extends MafiaTeamPlayer {
  ShadowMan({
    required super.name,
    super.job = '그림자',
    super.abilityText = '직업을 조사할 대상을 선택하세요',
    super.jobIcon = FontAwesomeIcons.shoePrints,
  });
}
