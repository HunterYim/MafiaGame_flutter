import 'package:flutter/material.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class SetupRoleScreen extends StatefulWidget {
  final int playerNum;
  final Map<String, dynamic> playerNames;

  const SetupRoleScreen({
    super.key,
    required this.playerNames,
    required this.playerNum,
  });

  @override
  State<SetupRoleScreen> createState() => _SetupRoleScreenState();
}

class _SetupRoleScreenState extends State<SetupRoleScreen> {
  Map<String, String> playerRoles = {
    '1': '경찰',
    '2': '의사',
    '3': '마피아1',
    '4': '마피아2',
    '5': '스파이',
    '6': '군인',
    '7': '건달',
    '8': '정치인',
  };
  Map<String, Map<String, dynamic>> playerData = {};

  @override
  void initState() {
    // int playerNum = widget.playerNum;
    super.initState();
    playerData['names'] = widget.playerNames;
    if (widget.playerNum == playerData['names']!.length) {
      for (var playerNum in playerData['names']!.keys) {
        playerRoles[playerNum] = '직업 $playerNum';
      }
      playerData['roles'] = playerRoles;
    }

    print(playerData);
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
                    '당신의 직업과 능력을 확인하세요',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            // 직업 확인 sector
            Flexible(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1000,
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Theme.of(context).canvasColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                        itemCount: widget.playerNames.length,
                        itemBuilder: (context, index) {
                          String playerNum =
                              playerData['names']!.keys.elementAt(index);
                          dynamic playerName = playerData['names']![playerNum];

                          String playerrole = playerData['roles']![playerNum];
                          return ListTile(
                            title: Text(
                              '$playerNum번 플레이어, $playerName님의 직업은 $playerrole입니다',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
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
