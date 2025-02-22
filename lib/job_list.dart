import 'dart:math';

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
    '시민1',
  ];

  static List<String> spy = [
    '간첩',
  ];
}

class SetupJobList {
  Map<JobListEnum, int> assignTeamByMode({
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
          assignedTeam[JobListEnum.mafia] = 2;
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

  List<String> getJobByTeam({
    required int jobNum,
    required List<String> jobListByTeam,
    required bool isRandom,
  }) {
    List<String> jobInstance = [];

    if (isRandom) jobListByTeam.shuffle(random);

    for (var i = 0; i < jobNum; i++) {
      jobInstance.add(jobListByTeam[i]);
    }

    return jobInstance;
  }

  List<String> getJobList({
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
}
