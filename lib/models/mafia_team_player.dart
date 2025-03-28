import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class MafiaTeamSkillPlayer extends SkillPlayer {
  MafiaTeamSkillPlayer({
    required super.name,
    required super.job,
    super.team = '마피아 팀',
    required super.skillText,
    required super.subText,
    super.isSpyTeam = false,
    required super.jobIcon,
  });
}

class MafiaTeamNoneSkillPlayer extends NoneSkillPlayer {
  MafiaTeamNoneSkillPlayer({
    required super.name,
    required super.job,
    super.team = '마피아 팀',
    required super.skillText,
    required super.subText,
    super.isSpyTeam = false,
    required super.jobIcon,
  });
}

class Mafia extends MafiaTeamSkillPlayer {
  bool isKill = false;
  List<String> otherMafias = [];

  static const IconData icon = IconData(
    0xF0703,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );

  void kill(GamePlayer target) {
    if (isKill) {
      target.die();
    }
  }

  Mafia({
    required super.name,
    super.job = '마피아',
    super.skillText = '공격을 원하는 대상 선택',
    super.subText = '',
    super.jobIcon = icon,
  });
}

class WereWolf extends MafiaTeamSkillPlayer {
  bool isMeet = false;

  WereWolf({
    required super.name,
    super.job = '늑대인간',
    super.skillText = '접선할 대상 선택',
    super.subText = '늑대인간 소개',
    super.jobIcon = FontAwesomeIcons.wolfPackBattalion,
  });
}

class ShadowMan extends MafiaTeamSkillPlayer {
  bool isMeet = false;

  ShadowMan({
    required super.name,
    super.job = '그림자',
    super.skillText = '직업 조사할 대상 선택',
    super.subText = '그림자 소개',
    super.jobIcon = FontAwesomeIcons.shoePrints,
  });
}
