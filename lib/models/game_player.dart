import 'package:flutter/material.dart';

class GamePlayer {
  final String name, job, team, abilityText;
  String subText;
  bool isAlive, isSpyTeam, isAbilityUsable;
  final IconData jobIcon;

  List<String> abilityTargets = [];
  List<String> usedAbilityTargets = [];

  GamePlayer({
    required this.name,
    required this.job,
    required this.team,
    required this.abilityText,
    required this.subText,
    required this.isSpyTeam,
    required this.isAbilityUsable,
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
