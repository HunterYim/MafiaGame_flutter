import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mafiagame/job_list.dart';
import 'package:mafiagame/screens/night_time_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/job_card_back_widget.dart';
import 'package:mafiagame/widget/job_card_front_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class SetupJobScreen extends StatefulWidget {
  final int playerNum;
  final bool isClassic;
  final Map<String, dynamic> playerNames;

  const SetupJobScreen({
    super.key,
    required this.playerNames,
    required this.playerNum,
    required this.isClassic,
  });

  @override
  State<SetupJobScreen> createState() => _SetupJobScreenState();
}

class _SetupJobScreenState extends State<SetupJobScreen> {
  int index = 1;
  bool isHide = true;
  late Color cardColor;
  late String playerTeam;
  List<String> mafiaList = [];
  Map<String, dynamic> playerInstances = {};

  late Timer timer;
  bool isRunning = false;
  static const fiveSeconds = 1;
  int totalSeconds = fiveSeconds;

  void onTick(Timer timer) {
    if (totalSeconds <= 1) {
      setState(() {
        isRunning = false;
        totalSeconds = fiveSeconds;
        timer.cancel();
        isHide = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onTapCheckJobButton() {
    setState(() {
      if (playerInstances[index.toString()].team == '마피아 팀') {
        cardColor = Theme.of(context).focusColor;
      } else if (playerInstances[index.toString()].team == '시민 팀') {
        cardColor = Theme.of(context).highlightColor;
      } else if (playerInstances[index.toString()].team == '간첩 팀') {
        cardColor = Theme.of(context).hintColor;
      }

      if (!isRunning && isHide) {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          onTick,
        );
        isRunning = true;
      }

      if (!isHide) {
        index = (index + 1) % (widget.playerNum + 1);
        if (index == 0) index = 1;
        isHide = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // 빈 플레이어 이름 초기화
    nullNameInit();
    // 게임 모드에 따라 직업 랜덤 배정
    setJobInstances();

    // 마피아 팀원 정보 메시지 초기화
    initMafiaSubText();

    print(playerInstances);
  }

  void nullNameInit() {
    for (var playerNum = 1; playerNum <= widget.playerNum; playerNum++) {
      if (widget.playerNames['$playerNum'] == '') {
        widget.playerNames['$playerNum'] = '$playerNum번 플레이어';
      }
    }
  }

  void setJobInstances() {
    playerInstances = SetupJobList.getPlayerInstances(
      isClassic: widget.isClassic,
      playerNames: widget.playerNames,
    );
  }

  void initMafiaSubText() {
    for (var playerId = 1; playerId <= widget.playerNum; playerId++) {
      if (playerInstances[playerId.toString()].job.contains('마피아')) {
        mafiaList.add('$playerId');
      }
    }

    for (var currencyMafia in mafiaList) {
      playerInstances[currencyMafia].otherMafias =
          mafiaList.where((mafia) => currencyMafia != mafia).toList();

      playerInstances[currencyMafia].subText += '마피아는 ';
      for (var otherMafia in playerInstances[currencyMafia].otherMafias) {
        playerInstances[currencyMafia].subText +=
            "'${playerInstances[otherMafia].name}' ";
      }
      playerInstances[currencyMafia].subText += '님 입니다';
    }
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
              Icons.search_outlined,
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
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '순서대로 카드의 직업을 확인하세요',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '$index번 플레이어',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 직업 확인 sector
            Flexible(
              flex: 10,
              child: GestureDetector(
                onTap: onTapCheckJobButton,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5, color: Theme.of(context).canvasColor),
                    borderRadius: BorderRadius.circular(20),
                    color: isHide
                        ? Theme.of(context).scaffoldBackgroundColor
                        : cardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: isHide
                            ? JobCardBackWidget(
                                isRunning: isRunning,
                                totalSeconds: totalSeconds,
                                playerInstances: playerInstances,
                                index: index,
                              )
                            : JobCardFrontWidget(
                                playerInstances: playerInstances,
                                index: index,
                              ),
                      ),
                    ],
                  ),
                ),
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
                        width: 120,
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
                                      NightTimeScreen(
                                        playerNum: widget.playerNum,
                                        playerInstances: playerInstances,
                                      )),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Start',
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
