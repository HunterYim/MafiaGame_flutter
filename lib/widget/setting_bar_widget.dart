import 'package:flutter/material.dart';

class SettingBarWidget extends StatelessWidget {
  const SettingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline_outlined),
          iconSize: 30,
          color: Theme.of(context).cardColor,
        ),
        SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
          iconSize: 30,
          color: Theme.of(context).cardColor,
        ),
      ],
    );
  }
}
