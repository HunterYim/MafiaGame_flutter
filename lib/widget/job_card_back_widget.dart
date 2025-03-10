import 'package:flutter/material.dart';

class JobCardBackWidget extends StatelessWidget {
  const JobCardBackWidget({
    super.key,
    required this.isRunning,
    required this.totalSeconds,
    required this.playerInstances,
    required this.index,
  });

  final bool isRunning;
  final int totalSeconds;
  final Map<String, dynamic> playerInstances;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        isRunning
            ? Text(
                '$totalSeconds',
                style: Theme.of(context).textTheme.titleSmall,
              )
            : Icon(
                Icons.question_mark_outlined,
                size: 100,
                color: Theme.of(context).cardColor,
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${playerInstances[index.toString()].name}',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
