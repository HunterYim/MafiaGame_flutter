import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class CitizenTeamPlayer extends GamePlayer {
  CitizenTeamPlayer({
    required super.name,
    required super.job,
    required super.jobIcon,
    super.isSpyTeam = false,
    super.team = '시민 팀',
    required super.abilityText,
  });
}

class Cop extends CitizenTeamPlayer {
  static const IconData icon = IconData(
    0xF1168,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );
  Cop({
    required super.name,
    super.job = '경찰',
    super.abilityText = '조사할 대상을 선택하세요',
    super.jobIcon = icon,
  });
}

class Doctor extends CitizenTeamPlayer {
  Doctor({
    required super.name,
    super.job = '의사',
    super.abilityText = '치료할 대상을 선택하세요',
    super.jobIcon = FontAwesomeIcons.stethoscope,
  });
}

class Soldier extends CitizenTeamPlayer {
  Soldier({
    required super.name,
    super.job = '군인',
    super.abilityText = '군인은 밤에 사용할 능력이 없습니다',
    super.jobIcon = Icons.import_contacts,
  });
}

class Politician extends CitizenTeamPlayer {
  Politician({
    required super.name,
    super.job = '정치인',
    super.abilityText = '정치인은 밤에 사용할 능력이 없습니다',
    super.jobIcon = Icons.import_contacts,
  });
}

class Undertaker extends CitizenTeamPlayer {
  Undertaker({
    required super.name,
    super.job = '장의사',
    super.abilityText = '직업을 조사할 대상을 선택하세요',
    super.jobIcon = Icons.import_contacts,
  });
}

class Lover extends CitizenTeamPlayer {
  Lover({
    required super.name,
    super.job = '연인',
    super.abilityText = '',
    super.jobIcon = Icons.import_contacts,
  });
}

class Gangster extends CitizenTeamPlayer {
  Gangster({
    required super.name,
    super.job = '건달',
    super.abilityText = '투표를 막을 대상을 선택하세요',
    super.jobIcon = FontAwesomeIcons.handFist,
  });
}

class Reporter extends CitizenTeamPlayer {
  bool isEmbargo = true;
  Reporter({
    required super.name,
    super.job = '기자',
    super.abilityText = '기사를 쓸 대상을 선택하세요',
    super.jobIcon = Icons.camera_alt_outlined,
  });
}

class Detective extends CitizenTeamPlayer {
  Detective({
    required super.name,
    super.job = '탐정',
    super.abilityText = '조사할 대상을 선택하세요',
    super.jobIcon = Icons.import_contacts,
  });
}

class Ghoul extends CitizenTeamPlayer {
  Ghoul({
    required super.name,
    super.job = '도굴꾼',
    super.abilityText = '도굴꾼은 밤에 사용할 능력이 없습니다',
    super.jobIcon = Icons.import_contacts,
  });
}

class Martyr extends CitizenTeamPlayer {
  Martyr({
    required super.name,
    super.job = '테러리스트',
    super.abilityText = '자폭할 대상을 선택하세요',
    super.jobIcon = Icons.import_contacts,
  });
}
