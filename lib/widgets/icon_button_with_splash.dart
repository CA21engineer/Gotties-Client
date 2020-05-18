import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/util/typedefs.dart';

class IconButtonWithSplash extends StatelessWidget {
  const IconButtonWithSplash({
    @required this.width,
    @required this.height,
    @required this.icon,
    this.splashColor = Colors.grey,
    this.onTapButton,
  });

  final double width;
  final double height;
  final Icon icon;
  final MaterialColor splashColor;
  final VoidFunction onTapButton;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white.withOpacity(0),
        child: InkWell(
          splashColor: splashColor,
          child: SizedBox(
            width: width,
            height: height,
            child: icon,
          ),
          onTap: onTapButton,
        ),
      ),
    );
  }
}
