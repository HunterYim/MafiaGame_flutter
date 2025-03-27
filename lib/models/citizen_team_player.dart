import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mafiagame/models/game_player.dart';

class CitizenTeamPlayer extends GamePlayer {
  CitizenTeamPlayer({
    required super.name,
    required super.job,
    required super.jobIcon,
    super.isSpyTeam = false,
    required super.isSkillUsable,
    super.team = '시민 팀',
    required super.skillText,
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
    super.skillText = '조사할 대상 선택',
    super.subText = '경찰 소개',
    super.jobIcon = icon,
    super.isSkillUsable = true,
  });

  String investigation(GamePlayer target) {
    String job = '';
    if (isSkillUsable) {
      job = target.job;
    }

    return job;
  }
}

class Doctor extends CitizenTeamPlayer {
  Doctor({
    required super.name,
    super.job = '의사',
    super.skillText = '치료할 대상 선택',
    super.subText = '의사 소개',
    super.jobIcon = FontAwesomeIcons.briefcaseMedical,
    super.isSkillUsable = true,
  });
}

class Soldier extends CitizenTeamPlayer {
  bool isUsed = false;
  Soldier({
    required super.name,
    super.job = '군인',
    super.skillText = '밤에 사용할 능력 없음',
    super.subText = '군인 소개',
    super.jobIcon = FontAwesomeIcons.personRifle,
    super.isSkillUsable = false,
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
    super.skillText = '밤에 사용할 능력 없음',
    super.subText = '정치인 소개',
    super.jobIcon = icon,
    super.isSkillUsable = false,
  });
}

class Undertaker extends CitizenTeamPlayer {
  Undertaker({
    required super.name,
    super.job = '장의사',
    super.skillText = '직업 조사할 대상 선택',
    super.subText = '장의사 소개',
    super.jobIcon = FontAwesomeIcons.sackDollar,
    super.isSkillUsable = true,
  });
}

class Lover extends CitizenTeamPlayer {
  Lover({
    required super.name,
    super.job = '연인',
    super.skillText = '',
    super.subText = '연인 소개',
    super.jobIcon = Icons.import_contacts,
    super.isSkillUsable = false,
  });
}

class Gangster extends CitizenTeamPlayer {
  Gangster({
    required super.name,
    super.job = '건달',
    super.skillText = '투표 금지시킬 대상 선택',
    super.subText = '건달 소개',
    super.jobIcon = FontAwesomeIcons.handFist,
    super.isSkillUsable = true,
  });
}

class Reporter extends CitizenTeamPlayer {
  bool isEmbargo = true;
  bool isUsed = false;
  Reporter({
    required super.name,
    super.job = '기자',
    super.skillText = '기사 쓸 대상 선택',
    super.subText = '기자 소개',
    super.jobIcon = Icons.camera_alt_outlined,
    super.isSkillUsable = true,
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
    super.skillText = '조사할 대상 선택',
    super.subText = '탐정 소개',
    super.jobIcon = icon,
    super.isSkillUsable = true,
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
    super.skillText = '밤에 사용할 능력 없음',
    super.subText = '도굴꾼 소개',
    super.jobIcon = icon,
    super.isSkillUsable = false,
  });
}

class Martyr extends CitizenTeamPlayer {
  Martyr({
    required super.name,
    super.job = '테러리스트',
    super.skillText = '자폭할 대상 선택',
    super.subText = '테러리스트 소개',
    super.jobIcon = FontAwesomeIcons.bomb,
    super.isSkillUsable = true,
  });
}

class Citizen extends CitizenTeamPlayer {
  Citizen({
    required super.name,
    super.job = '시민',
    super.skillText = '밤에 사용할 능력 없음',
    super.subText = '시민 소개',
    super.jobIcon = Icons.person,
    super.isSkillUsable = false,
  });
}
