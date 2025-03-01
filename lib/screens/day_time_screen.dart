import 'package:flutter/material.dart';
import 'package:mafiagame/screens/home_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class DayTimeScreen extends StatefulWidget {
  const DayTimeScreen({
    super.key,
  });

  @override
  State<DayTimeScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayTimeScreen> {
  int day = 1;

  late String playerTeam;
  Map<String, dynamic> playerInstances = {};

  @override
  void initState() {
    super.initState();
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
          leading: Container(),
          title: Row(
            children: [
              Icon(
                Icons.brightness_5,
                size: 40,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '$day번째 낮',
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
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              // 직업 확인 sector
              Flexible(
                flex: 9,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5, color: Theme.of(context).canvasColor),
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).canvasColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
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
                                        HomeScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
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
