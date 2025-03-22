import 'package:mafiagame/job_list.dart';

class GameController {
  final int playerNum;
  final bool isClassic;

  final Map<String, dynamic> playerNames;

  late List<String> playerIds;
  late Map<String, dynamic> playerInstances;

  List<String> initPlayerIds(int playerNum) {
    List<String> playerIds = [];
    for (var idx = 1; idx <= playerNum; idx++) {
      playerIds.add(idx.toString());
    }

    return playerIds;
  }

  Map<String, dynamic> initPlayerInstances() {
    Map<String, dynamic> playerIncetances = SetupJobList.getPlayerInstances(
        isClassic: isClassic, playerNames: playerNames);
    return playerIncetances;
  }

  GameController({
    required this.playerNum,
    required this.isClassic,
    required this.playerNames,
  });

  void initController() {
    playerIds = initPlayerIds(playerNum);
    playerInstances = initPlayerInstances();

    print('게임 컨트롤러가 인스턴스 생성: $playerInstances');
  }
}
