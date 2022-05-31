import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key,
      required this.image,
      required this.size,
      this.color,
      this.splashColor,
      required this.action,
      this.backgroundColor})
      : super(key: key);
  final VoidCallback action;
  final String image;
  final double size;
  final Color? color;
  final Color? backgroundColor;
  final Color? splashColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(size, size),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          splashColor: splashColor,
          onTap: action,
          child: Center(
              child: SvgPicture.asset(
            image,
            color: color,
          )),
        ),
      ),
    );
  }
}
