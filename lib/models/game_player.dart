import 'package:flutter/material.dart';

class GamePlayer {
  final String name, job, team, abilityText;
  bool isAlive, isSpyTeam;
  final IconData jobIcon;
  String subText;

  GamePlayer({
    required this.name,
    required this.job,
    required this.team,
    required this.abilityText,
    required this.isSpyTeam,
    required this.jobIcon,
  })  : isAlive = true,
        subText = '';

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
