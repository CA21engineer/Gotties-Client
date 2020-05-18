import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/util/typedefs.dart';

class IconButtonWithSplash extends StatelessWidget {
  const IconButtonWithSplash({this.width, this.height, this.icon, this.splashColor = Colors.grey, this.onTapButton});

  @required
  final double width;
  @required
  final double height;
  @required
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
            width: height,
            height: width,
            child: icon,
          ),
          onTap: onTapButton,
        ),
      ),
    );
  }
}
