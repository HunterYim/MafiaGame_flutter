import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mafiagame/screens/day_time_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/job_card_back_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class NightTimeScreen extends StatefulWidget {
  final Map<String, dynamic> playerInstances;

  const NightTimeScreen({
    super.key,
    required this.playerInstances,
  });

  @override
  State<NightTimeScreen> createState() => _NightScreenState();
}

class _NightScreenState extends State<NightTimeScreen> {
  late String playerTeam;

  int day = 0;
  String id = '1';
  bool isHide = true;
  late Color cardColor;

  late Timer timer;
  bool isRunning = false;
  static const fiveSeconds = 1;
  int totalSeconds = fiveSeconds;

  void onTick(Timer timer) {
    if (totalSeconds == 1) {
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

  void onTapCard() {
    setState(() {
      if (widget.playerInstances[id].team == '마피아 팀') {
        cardColor = Theme.of(context).focusColor;
      } else if (widget.playerInstances[id].team == '시민 팀') {
        cardColor = Theme.of(context).highlightColor;
      } else if (widget.playerInstances[id].team == '간첩 팀') {
        cardColor = Theme.of(context).hintColor;
      }

      if (!isRunning && isHide) {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          onTick,
        );
        isRunning = true;
      }
    });
  }

  void onTabPlayerButton(int currentKey, String currentTarget) {
    setState(() {
      String currentId = (currentKey + 1).toString();
      print('$currentKey, $currentId, $currentTarget');

      if (!isHide) {
        int index = int.parse(id);
        index = (index + 1) % (widget.playerInstances.length + 1);
        id = index.toString();
        if (index == 0) id = '1';
        isHide = true;
      }
    });
  }

  String setCurrentTarget(int key) {
    final targetId = widget.playerInstances[id].abilityTargets[key];

    String firstTargetId = widget.playerInstances[id].abilityTargets[0];
    String currentTarget = '';

    if (firstTargetId != '0') {
      currentTarget = widget.playerInstances[targetId].name;
    } else if (firstTargetId == '0') {
      currentTarget = '능력 사용 없음: 다음 순서로';
    }
    return currentTarget;
  }

  Future<bool?> showConfirmationDialog(
    BuildContext context, {
    required String message,
  }) async {
    return showGeneralDialog<bool>(
      context: context,
      transitionDuration: Duration(milliseconds: 70),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Text(message, style: Theme.of(context).textTheme.labelSmall),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('취소', style: Theme.of(context).textTheme.labelSmall),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('확인', style: Theme.of(context).textTheme.labelSmall),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    day += 1;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          foregroundColor: Theme.of(context).textTheme.headlineLarge!.color,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0,
          leading: Container(),
          title: Row(
            children: [
              Icon(
                Icons.nights_stay_outlined,
                size: 40,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '$day번째 밤',
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
                          '순서대로 능력을 사용하세요',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          isHide
                              ? '$id번 플레이어'
                              : '${widget.playerInstances[id].job}: ${widget.playerInstances[id].abilityText}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 능력 사용 sector
              Flexible(
                flex: 10,
                child: GestureDetector(
                  onTap: onTapCard,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: isHide
                              ? Theme.of(context).canvasColor
                              : cardColor),
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: isHide
                              ? JobCardBackWidget(
                                  isRunning: isRunning,
                                  totalSeconds: totalSeconds,
                                  playerInstances: widget.playerInstances,
                                  id: id,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: (widget
                                                  .playerInstances[id]
                                                  .abilityTargets
                                                  .length ==
                                              1)
                                          ? 1
                                          : 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: (widget
                                                  .playerInstances[id]
                                                  .abilityTargets
                                                  .length ==
                                              1)
                                          ? 3.0
                                          : 2.0,
                                    ),
                                    itemCount: widget.playerInstances[id]
                                        .abilityTargets.length,
                                    itemBuilder: (context, key) {
                                      String currentTarget =
                                          setCurrentTarget(key);
                                      return GestureDetector(
                                        onTap: () async {
                                          final isConfirmed =
                                              await showConfirmationDialog(
                                                  context,
                                                  message:
                                                      "'$currentTarget'를 선택합니다.");
                                          if (isConfirmed == true) {
                                            onTabPlayerButton(
                                                key, currentTarget);
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.8,
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentTarget,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
                                        DayTimeScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '밤 종료',
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
      ),
    );
  }
}
