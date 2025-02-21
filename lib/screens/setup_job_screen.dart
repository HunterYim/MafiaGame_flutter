import 'package:flutter/material.dart';
import 'package:mafiagame/models/game_player.dart';
import 'package:mafiagame/models/mafia_team_player.dart';
import 'package:mafiagame/screens/home_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class SetupJobScreen extends StatefulWidget {
  final int playerNum;
  final Map<String, dynamic> playerNames;

  const SetupJobScreen({
    super.key,
    required this.playerNames,
    required this.playerNum,
  });

  @override
  State<SetupJobScreen> createState() => _SetupJobScreenState();
}

class _SetupJobScreenState extends State<SetupJobScreen> {
  Map<String, Map<String, dynamic>> playersData = {};

  @override
  void initState() {
    super.initState();

    for (var playerNum = 1; playerNum <= widget.playerNum; playerNum++) {
      if (widget.playerNames['$playerNum'] == '') {
        widget.playerNames['$playerNum'] = '$playerNum번 플레이어';
      }
      Map<String, dynamic> playerData = {};

      playerData['name'] = widget.playerNames['$playerNum'];
      playerData['job'] = '직업 $playerNum';
      playersData['$playerNum'] = playerData;
    }

    print(playersData);

    GamePlayer player1 = Mafia(name: playersData['1']!['name']);
    player1.die();
    print(player1.isAlive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: Theme.of(context).textTheme.headlineLarge!.color,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Icon(
              Icons.casino_outlined,
              size: 40,
              color: Theme.of(context).cardColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '직업 확인',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // 안내 문구 sector
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '직업을 확인하세요',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            // 직업 확인 sector
            Flexible(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 100,
                      horizontal: 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Theme.of(context).canvasColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${playersData['1']!['name']}님의 직업은 ${playersData['1']!['job']}입니다',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),
            // 버튼 sector
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).canvasColor,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      HomeScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '게임 시작',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 설명, 세팅 sector
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SettingBarWidget(),
                              HomeButtonWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
