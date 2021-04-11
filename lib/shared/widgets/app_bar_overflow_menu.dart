import 'package:flutter/material.dart';

@immutable
class AppBarOverflowMenu extends StatelessWidget {
  final Map<String, Function> menuOptions;

  AppBarOverflowMenu({@required this.menuOptions});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) => menuOptions[value](),
      itemBuilder: (BuildContext context) {
        return menuOptions.keys.map(
          (String option) {
            return PopupMenuItem<String>(
              value: option,
              child: Text(option),
            );
          },
        ).toList();
      },
    );
  }
}
