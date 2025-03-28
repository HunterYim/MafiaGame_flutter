import 'package:flutter/material.dart';

class GamePlayer {
  final String name, job, team, skillText;
  String subText;
  bool isAlive, isSpyTeam, isSkillUsable;
  final IconData jobIcon;

  List<String> skillTargets = [];
  List<String> usedSkillTargets = [];

  GamePlayer({
    required this.name,
    required this.job,
    required this.team,
    required this.skillText,
    required this.subText,
    required this.isSpyTeam,
    required this.isSkillUsable,
    required this.jobIcon,
  }) : isAlive = true;

  void vote(GamePlayer targetPlayer) {
    // 투표 기능 구현
  }

  void die() {
    isAlive = false;
    print('$name이 죽었습니다.');
  }

  void takenBySpy() {
    isSpyTeam = true;
  }
}

class SkillPlayer extends GamePlayer {
  SkillPlayer({
    required super.name,
    required super.job,
    required super.team,
    required super.skillText,
    required super.subText,
    required super.isSpyTeam,
    required super.jobIcon,
    super.isSkillUsable = true,
  });
}

class NoneSkillPlayer extends GamePlayer {
  NoneSkillPlayer({
    required super.name,
    required super.job,
    required super.team,
    required super.skillText,
    required super.subText,
    required super.isSpyTeam,
    required super.jobIcon,
    super.isSkillUsable = false,
  });
}
