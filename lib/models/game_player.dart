import 'package:flutter/material.dart';

class GamePlayer {
  final String name, job, team, abilityText;
  String subText;
  bool isAlive, isSpyTeam;
  final IconData jobIcon;

  GamePlayer({
    required this.name,
    required this.job,
    required this.team,
    required this.abilityText,
    required this.subText,
    required this.isSpyTeam,
    required this.jobIcon,
  }) : isAlive = true;

  void vote(GamePlayer targetPlayer) {
    // 투표 기능 구현
  }

  void die() {
    isAlive = false;
  }

  void takenBySpy() {
    isSpyTeam = true;
  }
}
