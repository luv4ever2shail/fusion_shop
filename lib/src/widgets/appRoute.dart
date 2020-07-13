import 'package:flutter/material.dart';

class AppRoutes<T> extends MaterialPageRoute<T> {
  AppRoutes({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == "BottomTabScreen") {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
