import 'package:flutter/material.dart';

class JobCardFrontWidget extends StatelessWidget {
  const JobCardFrontWidget({
    super.key,
    required this.playerInstances,
    required this.id,
  });

  final Map<String, dynamic> playerInstances;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          playerInstances[id].jobIcon,
          size: 100,
          color: Theme.of(context).cardColor,
        ),
        Text(
          '"${playerInstances[id].job}"',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: Text(
              '${playerInstances[id].subText}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
