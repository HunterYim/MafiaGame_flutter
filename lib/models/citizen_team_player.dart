import 'package:mafiagame/models/game_player.dart';

class CitizenTeamPlayer extends GamePlayer {
  CitizenTeamPlayer({
    required super.name,
    required super.job,
    super.isSpyTeam = false,
    super.team = '시민 팀',
  });
}

class Cop extends CitizenTeamPlayer {
  Cop({
    required super.name,
    super.job = '경찰',
  });
}

class Doctor extends CitizenTeamPlayer {
  Doctor({
    required super.name,
    super.job = '의사',
  });
}

class Soldier extends CitizenTeamPlayer {
  Soldier({
    required super.name,
    super.job = '군인',
  });
}

class Politician extends CitizenTeamPlayer {
  Politician({
    required super.name,
    super.job = '정치인',
  });
}

class Undertaker extends CitizenTeamPlayer {
  Undertaker({
    required super.name,
    super.job = '장의사',
  });
}

class Lover extends CitizenTeamPlayer {
  Lover({
    required super.name,
    super.job = '연인',
  });
}

class Gangster extends CitizenTeamPlayer {
  Gangster({
    required super.name,
    super.job = '건달',
  });
}

class Reporter extends CitizenTeamPlayer {
  Reporter({
    required super.name,
    super.job = '기자',
  });
}

class Detective extends CitizenTeamPlayer {
  Detective({
    required super.name,
    super.job = '탐정',
  });
}

class Ghoul extends CitizenTeamPlayer {
  Ghoul({
    required super.name,
    super.job = '도굴꾼',
  });
}

class Martyr extends CitizenTeamPlayer {
  Martyr({
    required super.name,
    super.job = '테러리스트',
  });
}
