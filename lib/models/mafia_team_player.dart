import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class MafiaTeamPlayer extends GamePlayer {
  MafiaTeamPlayer({
    required super.name,
    required super.job,
    required super.abilityText,
    required super.subText,
    required super.jobIcon,
    super.isSpyTeam = false,
    super.team = '마피아 팀',
  });
}

class Mafia extends MafiaTeamPlayer {
  bool isKill = false;
  List<String> otherMafias = [];

  static const IconData icon = IconData(
    0xF0703,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );

  Mafia({
    required super.name,
    super.job = '마피아',
    super.abilityText = '공격할 대상 선택',
    super.subText = '',
    super.jobIcon = icon,
  });
}

class WereWolf extends MafiaTeamPlayer {
  bool isMeet = false;

  WereWolf({
    required super.name,
    super.job = '늑대인간',
    super.abilityText = '접선할 대상 선택',
    super.subText = '늑대인간 소개',
    super.jobIcon = FontAwesomeIcons.wolfPackBattalion,
  });
}

class ShadowMan extends MafiaTeamPlayer {
  bool isMeet = false;

  ShadowMan({
    required super.name,
    super.job = '그림자',
    super.abilityText = '직업 조사할 대상 선택',
    super.subText = '그림자 소개',
    super.jobIcon = FontAwesomeIcons.shoePrints,
  });
}
