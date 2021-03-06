import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

class TextIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  TextIconButton({
    @required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: backgroundColor ?? Colors.black,
      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 4),
      margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 4),
      width: SizeConfig.blockSizeVertical * 16,
      height: SizeConfig.blockSizeVertical * 16,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text ?? 'Sample text',
                style: TextStyle(
                  color: color ?? Colors.white,
                  fontSize: 32,
                ),
              ),
              Container(
                height: 16,
                width: 16,
              ),
              Icon(
                icon ?? Icons.assignment_turned_in_rounded,
                color: color ?? Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
