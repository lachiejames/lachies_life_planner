import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

class TextIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final int fontSize;
  final int iconSize;
  final double spacingSize;
  final double buttonSize;

  TextIconButton({
    @required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.fontSize,
    this.iconSize,
    this.spacingSize,
    this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: backgroundColor ?? Colors.black,
      padding: padding ?? EdgeInsets.all(SizeConfig.blockSizeVertical * 4),
      margin: margin ?? EdgeInsets.all(SizeConfig.blockSizeVertical * 4),
      width: buttonSize ?? SizeConfig.blockSizeVertical * 16,
      height: buttonSize ?? SizeConfig.blockSizeVertical * 16,
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
                  fontSize: fontSize ?? 32,
                ),
              ),
              Container(
              height: spacingSize ?? 16,
              width: spacingSize ?? 16,
              ),
              Icon(
                icon ?? Icons.assignment_turned_in_rounded,
                color: color ?? Colors.white,
                size: iconSize ?? 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
