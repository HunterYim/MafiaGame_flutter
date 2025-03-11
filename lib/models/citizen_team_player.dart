import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class CitizenTeamPlayer extends GamePlayer {
  CitizenTeamPlayer({
    required super.name,
    required super.job,
    required super.jobIcon,
    super.isSpyTeam = false,
    required super.isAbilityUsable,
    super.team = '시민 팀',
    required super.abilityText,
    required super.subText,
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
    super.abilityText = '조사할 대상 선택',
    super.subText = '경찰 소개',
    super.jobIcon = icon,
    super.isAbilityUsable = true,
  });
}

class Doctor extends CitizenTeamPlayer {
  Doctor({
    required super.name,
    super.job = '의사',
    super.abilityText = '치료할 대상 선택',
    super.subText = '의사 소개',
    super.jobIcon = FontAwesomeIcons.briefcaseMedical,
    super.isAbilityUsable = true,
  });
}

class Soldier extends CitizenTeamPlayer {
  bool isUsed = false;
  Soldier({
    required super.name,
    super.job = '군인',
    super.abilityText = '밤에 사용할 능력 없음',
    super.subText = '군인 소개',
    super.jobIcon = FontAwesomeIcons.personRifle,
    super.isAbilityUsable = false,
  });
}

class Politician extends CitizenTeamPlayer {
  static const IconData icon = IconData(
    0xF0A1F,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );

  Politician({
    required super.name,
    super.job = '정치인',
    super.abilityText = '밤에 사용할 능력 없음',
    super.subText = '정치인 소개',
    super.jobIcon = icon,
    super.isAbilityUsable = false,
  });
}

class Undertaker extends CitizenTeamPlayer {
  Undertaker({
    required super.name,
    super.job = '장의사',
    super.abilityText = '직업 조사할 대상 선택',
    super.subText = '장의사 소개',
    super.jobIcon = FontAwesomeIcons.sackDollar,
    super.isAbilityUsable = true,
  });
}

class Lover extends CitizenTeamPlayer {
  Lover({
    required super.name,
    super.job = '연인',
    super.abilityText = '',
    super.subText = '연인 소개',
    super.jobIcon = Icons.import_contacts,
    super.isAbilityUsable = false,
  });
}

class Gangster extends CitizenTeamPlayer {
  Gangster({
    required super.name,
    super.job = '건달',
    super.abilityText = '투표 금지시킬 대상 선택',
    super.subText = '건달 소개',
    super.jobIcon = FontAwesomeIcons.handFist,
    super.isAbilityUsable = true,
  });
}

class Reporter extends CitizenTeamPlayer {
  bool isEmbargo = true;
  bool isUsed = false;
  Reporter({
    required super.name,
    super.job = '기자',
    super.abilityText = '기사 쓸 대상 선택',
    super.subText = '기자 소개',
    super.jobIcon = Icons.camera_alt_outlined,
    super.isAbilityUsable = true,
  });
}

class Detective extends CitizenTeamPlayer {
  static const IconData icon = IconData(
    0xF140D,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );

  Detective({
    required super.name,
    super.job = '탐정',
    super.abilityText = '조사할 대상 선택',
    super.subText = '탐정 소개',
    super.jobIcon = icon,
    super.isAbilityUsable = true,
  });
}

class Ghoul extends CitizenTeamPlayer {
  static const IconData icon = IconData(
    0xF08B7,
    fontFamily: 'Material Design Icons',
    fontPackage: 'material_design_icons_flutter',
  );

  Ghoul({
    required super.name,
    super.job = '도굴꾼',
    super.abilityText = '밤에 사용할 능력 없음',
    super.subText = '도굴꾼 소개',
    super.jobIcon = icon,
    super.isAbilityUsable = false,
  });
}

class Martyr extends CitizenTeamPlayer {
  Martyr({
    required super.name,
    super.job = '테러리스트',
    super.abilityText = '자폭할 대상 선택',
    super.subText = '테러리스트 소개',
    super.jobIcon = FontAwesomeIcons.bomb,
    super.isAbilityUsable = true,
  });
}

class Citizen extends CitizenTeamPlayer {
  Citizen({
    required super.name,
    super.job = '시민',
    super.abilityText = '밤에 사용할 능력 없음',
    super.subText = '시민 소개',
    super.jobIcon = Icons.person,
    super.isAbilityUsable = false,
  });
}
