import 'package:flutter/material.dart';

const OrangeColor = const Color(0xFFF09414);
const GreyColor = const Color(0xFF323232);

class DividerLine extends StatelessWidget {

  final double thickness;
  final Color color;
  final double padding;

  DividerLine(this.thickness, this.color, this.padding);

  @override
  Widget build(BuildContext context) {
    return SizedBox( //simple box that looks like a line for dividing elements
      child: Center(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: padding, end: padding),
          height: thickness,
          color: color,
        ),
      ),
    );
  }
}


class SlideRightRoute extends PageRouteBuilder {

  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideLeftRoute extends PageRouteBuilder {

  final Widget page;
  SlideLeftRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}