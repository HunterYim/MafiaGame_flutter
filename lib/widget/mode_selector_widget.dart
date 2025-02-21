import 'package:flutter/material.dart';
import 'package:mafiagame/screens/setup_screen.dart';

class ModeSelector extends StatelessWidget {
  final int minPlayer, maxPlayer;
  final bool isClassic;

  const ModeSelector({
    super.key,
    required this.minPlayer,
    required this.maxPlayer,
    required this.isClassic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 210,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Theme.of(context).canvasColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SetupScreen(
                              minPlayer: minPlayer,
                              maxPlayer: maxPlayer,
                              isClassic: isClassic,
                            )),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      isClassic ? Icons.group_outlined : Icons.groups_outlined,
                      size: 60,
                      color: Theme.of(context).cardColor,
                    ),
                    Text(
                      '$minPlayer ~ $maxPlayer명',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      isClassic ? '마피아 vs 시민' : '마피아 vs 시민 vs 간첩',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
