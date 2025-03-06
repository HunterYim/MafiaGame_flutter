import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mafiagame/screens/day_time_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class NightTimeScreen extends StatefulWidget {
  final int playerNum;
  final Map<String, dynamic> playerInstances;

  const NightTimeScreen({
    super.key,
    required this.playerNum,
    required this.playerInstances,
  });

  @override
  State<NightTimeScreen> createState() => _NightScreenState();
}

class _NightScreenState extends State<NightTimeScreen> {
  late String playerTeam;

  int day = 0;
  int index = 1;
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
      if (widget.playerInstances[index.toString()].team == '마피아 팀') {
        cardColor = Theme.of(context).focusColor;
      } else if (widget.playerInstances[index.toString()].team == '시민 팀') {
        cardColor = Theme.of(context).highlightColor;
      } else if (widget.playerInstances[index.toString()].team == '간첩 팀') {
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

  void onTabPlayerButton() {
    setState(() {
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
                              ? '$index번 플레이어'
                              : widget.playerInstances[index.toString()]
                                  .abilityText,
                          style: Theme.of(context).textTheme.bodyLarge,
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
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    isRunning
                                        ? Text(
                                            '$totalSeconds',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          )
                                        : Icon(
                                            Icons.question_mark_outlined,
                                            size: 100,
                                            color: Theme.of(context).cardColor,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        '${widget.playerInstances[index.toString()].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 1.4,
                                    ),
                                    itemCount: widget.playerNum,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: onTabPlayerButton,
                                        child: IntrinsicWidth(
                                          child: IntrinsicHeight(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 3,
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${widget.playerInstances[(index + 1).toString()].name}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
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
