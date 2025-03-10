import 'package:flutter/material.dart';

class JobCardFrontWidget extends StatelessWidget {
  const JobCardFrontWidget({
    super.key,
    required this.playerInstances,
    required this.index,
  });

  final Map<String, dynamic> playerInstances;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          playerInstances[index.toString()].jobIcon,
          size: 100,
          color: Theme.of(context).cardColor,
        ),
        Text(
          '"${playerInstances[index.toString()].job}"',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: Text(
              '${playerInstances[index.toString()].subText}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
