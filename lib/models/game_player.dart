class GamePlayer {
  final String name, job, team;
  bool isAlive, isSpyTeam;

  GamePlayer({
    required this.name,
    required this.job,
    required this.team,
    required this.isSpyTeam,
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
