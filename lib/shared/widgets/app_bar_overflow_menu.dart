import 'package:flutter/material.dart';

class AppBarOverflowMenu extends StatelessWidget {
  final Map<String, Function> menuOptions;

  AppBarOverflowMenu({@required this.menuOptions});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) => menuOptions[value](),
      itemBuilder: (BuildContext context) {
        return menuOptions.keys.map(
          (String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          },
        ).toList();
      },
    );
  }
}
