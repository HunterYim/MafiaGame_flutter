import 'package:flutter/material.dart';
import 'package:mafiagame/screens/setup_job_screen.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/name_box_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class SetupNameScreen extends StatefulWidget {
  final int playerNum;
  final bool isClassic;

  const SetupNameScreen({
    super.key,
    required this.playerNum,
    required this.isClassic,
  });

  @override
  State<SetupNameScreen> createState() => _SetupNameScreenState();
}

class _SetupNameScreenState extends State<SetupNameScreen> {
  late Future<Map<String, dynamic>> startPlayerNames;
  List<String> playerKeys = [];
  Map<String, dynamic> playerNames = {};

  Future<Map<String, dynamic>> namesAsign() async {
    Map<String, dynamic> startPlayerDataInstances = {};
    for (var key in playerKeys) {
      startPlayerDataInstances[key] = '$key번 플레이어';
    }
    return startPlayerDataInstances;
  }

  void setPlayerKeys() {
    for (var key = 1; key <= widget.playerNum; key++) {
      playerKeys.add(key.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    setPlayerKeys();

    startPlayerNames = namesAsign();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          foregroundColor: Theme.of(context).textTheme.headlineLarge!.color,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            children: [
              Icon(
                Icons.edit_outlined,
                size: 40,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '이름 설정',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              // 이름 입력 sector
              Flexible(
                flex: 12,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: FutureBuilder(
                          future: startPlayerNames,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              playerNames = snapshot.data!;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 40,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    for (var key in snapshot.data!.keys)
                                      NameBoxWidget(
                                        name: playerNames[key]!,
                                        playerNum: key,
                                        onTextChanged: (playerNum, name) {
                                          setState(() {
                                            playerNames[key] = name;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
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
                                        SetupJobScreen(
                                          playerNames: playerNames,
                                          playerNum: widget.playerNum,
                                          isClassic: widget.isClassic,
                                          playerKeys: playerKeys,
                                        )),
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
