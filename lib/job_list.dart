import 'dart:math';

Random random = Random();

class JobList {
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

  static List<String> spy = [
    '간첩',
  ];

  static Map<String, int> assignTeam(int playerNum) {
    late Map<String, int> assignedTeam = {};

    switch (playerNum) {
      case 4:
        assignedTeam['mafia'] = 1;
        assignedTeam['requiredCitizen'] = 2;
        assignedTeam['specialCitizen'] = 2;
        break;
    }

    return assignedTeam;
  }

  static List<String> getRandomJobList(int jobNum, List<String> jobList) {
    List<String> jobInstance = [];

    jobList.shuffle(random);

    for (var i = 0; i < jobNum; i++) {
      jobInstance.add(jobList[i]);
    }

    return jobInstance;
  }

  static List<String> getJobList(int jobNum, List<String> jobList) {
    List<String> jobInstance = [];

    for (var i = 0; i < jobNum; i++) {
      jobInstance.add(jobList[i]);
    }

    return jobInstance;
  }
}
