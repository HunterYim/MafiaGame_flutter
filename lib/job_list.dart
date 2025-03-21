import 'dart:math';
import 'package:mafiagame/models/citizen_team_player.dart';
import 'package:mafiagame/models/mafia_team_player.dart';
import 'package:mafiagame/models/spy_team_player.dart';

Random random = Random();

enum JobListEnum {
  mafia,
  mafiaSupporter,
  requiredCitizen,
  specialCitizen,
  normalCitizen,
  spy,
}

class JobListByTeam {
  static final List<String> mafia = [
    '마피아1',
    '마피아2',
    '마피아3',
  ];

  static final List<String> mafiaSupporter = [
    '늑대인간',
    '그림자',
  ];

  static List<String> requiredCitizen = [
    '경찰',
    '의사',
  ];

  static List<String> specialCitizen = [
    '군인',
    '정치인',
    '장의사',
    '건달',
    '기자',
    '탐정',
    '도굴꾼',
    '테러리스트',
  ];

  static List<String> normalCitizen = [
    '시민',
  ];

  static List<String> spy = [
    '간첩',
  ];
}

// 게임 인원수에 맞게 팀별 인원수 할당
class SetupJobList {
  static Map<JobListEnum, int> assignTeamByMode({
    required int playerNum,
    required bool isClassic,
  }) {
    Map<JobListEnum, int> assignedTeam = {};

    if (isClassic) {
      switch (playerNum) {
        case 4:
          assignedTeam[JobListEnum.mafia] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 1;
          break;
        case 5:
          assignedTeam[JobListEnum.mafia] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 2;
          break;
        case 6:
          assignedTeam[JobListEnum.mafia] = 1;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 2;
          break;
        case 7:
          assignedTeam[JobListEnum.mafia] = 1;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 3;
          break;
        case 8:
          assignedTeam[JobListEnum.mafia] = 2;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 3;
          break;
        case 9:
          assignedTeam[JobListEnum.mafia] = 2;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 4;
          break;
        case 10:
          assignedTeam[JobListEnum.mafia] = 3;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 4;
          break;
        case 11:
          assignedTeam[JobListEnum.mafia] = 3;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 5;
          break;
        case 12:
          assignedTeam[JobListEnum.mafia] = 3;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 5;
          assignedTeam[JobListEnum.normalCitizen] = 1;
          break;
      }
    } else {
      switch (playerNum) {
        case 9:
          assignedTeam[JobListEnum.mafia] = 2;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 3;
          assignedTeam[JobListEnum.spy] = 1;
          break;
        case 10:
          assignedTeam[JobListEnum.mafia] = 2;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 4;
          assignedTeam[JobListEnum.spy] = 1;
          break;
        case 11:
          assignedTeam[JobListEnum.mafia] = 3;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 4;
          assignedTeam[JobListEnum.spy] = 1;
          break;
        case 12:
          assignedTeam[JobListEnum.mafia] = 3;
          assignedTeam[JobListEnum.mafiaSupporter] = 1;
          assignedTeam[JobListEnum.requiredCitizen] = 2;
          assignedTeam[JobListEnum.specialCitizen] = 5;
          assignedTeam[JobListEnum.spy] = 1;
          break;
      }
    }
    return assignedTeam;
  }

  // 팀별 할당된 인원수만큼 직업 할당
  static List<String> getJobByTeam({
    required int jobNum,
    required List<String> jobListByTeam,
    required bool isRandom,
  }) {
    List<String> jobInstances = [];

    if (isRandom) jobListByTeam.shuffle(random);

    for (var i = 0; i < jobNum; i++) {
      jobInstances.add(jobListByTeam[i]);
    }

    return jobInstances;
  }

  // 인원수에 맞게 게임에 사용될 직업 리스트 할당
  static List<String> getJobList({
    required int playerNum,
    required bool isClassic,
  }) {
    Map<JobListEnum, int> assignedTeam = assignTeamByMode(
      playerNum: playerNum,
      isClassic: isClassic,
    );

    List<String> jobList = [];

    for (MapEntry<JobListEnum, int> entry in assignedTeam.entries) {
      switch (entry.key) {
        case JobListEnum.mafia:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.mafia,
            isRandom: false,
          ));

          break;
        case JobListEnum.mafiaSupporter:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.mafiaSupporter,
            isRandom: true,
          ));

          break;
        case JobListEnum.requiredCitizen:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.requiredCitizen,
            isRandom: false,
          ));

          break;
        case JobListEnum.specialCitizen:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.specialCitizen,
            isRandom: true,
          ));

          break;
        case JobListEnum.normalCitizen:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.normalCitizen,
            isRandom: false,
          ));

          break;
        case JobListEnum.spy:
          jobList.addAll(getJobByTeam(
            jobNum: entry.value,
            jobListByTeam: JobListByTeam.spy,
            isRandom: false,
          ));

          break;
      }
    }
    jobList.shuffle(random);

    return jobList;
  }

  // 직업 리스트에 해당하는 직업 인스턴스 리스트 생성
  static Map<String, dynamic> getPlayerInstances({
    required bool isClassic,
    required Map<String, dynamic> playerNames,
  }) {
    int playerNum = playerNames.length;
    List<String> jobList = getJobList(
      playerNum: playerNum,
      isClassic: isClassic,
    );
    Map<String, dynamic> playerInstances = {};

    for (var id = 1; id <= playerNum; id++) {
      if (JobListByTeam.mafia.contains(jobList[id - 1])) {
        playerInstances['$id'] = Mafia(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '늑대인간') {
        playerInstances['$id'] = WereWolf(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '그림자') {
        playerInstances['$id'] = ShadowMan(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '경찰') {
        playerInstances['$id'] = Cop(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '의사') {
        playerInstances['$id'] = Doctor(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '군인') {
        playerInstances['$id'] = Soldier(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '정치인') {
        playerInstances['$id'] = Politician(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '장의사') {
        playerInstances['$id'] = Undertaker(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '건달') {
        playerInstances['$id'] = Gangster(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '기자') {
        playerInstances['$id'] = Reporter(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '탐정') {
        playerInstances['$id'] = Detective(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '도굴꾼') {
        playerInstances['$id'] = Ghoul(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '테러리스트') {
        playerInstances['$id'] = Martyr(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '시민') {
        playerInstances['$id'] = Citizen(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      } else if (jobList[id - 1] == '간첩') {
        playerInstances['$id'] = Spy(
          name: playerNames['$id'],
          job: jobList[id - 1],
        );
      }
    }

    return playerInstances;
  }
}
