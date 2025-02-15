import 'package:flutter/material.dart';
import 'package:mafiagame/widget/home_button_widget.dart';
import 'package:mafiagame/widget/mode_selector_widget.dart';
import 'package:mafiagame/widget/setting_bar_widget.dart';

class ModeSelectScreen extends StatelessWidget {
  const ModeSelectScreen({super.key});

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
              Icons.check_circle_outlined,
              size: 40,
              color: Theme.of(context).cardColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '모드 선택',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // 모드 선택 sector
            Flexible(
              flex: 14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 기본 모드: 4 ~ 8명
                  ModeSelector(
                    minPlayer: 4,
                    maxPlayer: 8,
                    isBasic: true,
                  ),
                  // 확장 모드: 9 ~ 12명
                  ModeSelector(
                    minPlayer: 9,
                    maxPlayer: 12,
                    isBasic: false,
                  )
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
