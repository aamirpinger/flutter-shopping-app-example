import 'package:flutter/material.dart';
import 'package:my_app/core/modal/cart_screen_input.dart';
import 'package:my_app/ui/screens/cart_screen.dart';
import 'package:my_app/ui/screens/main_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case CartScreen.routeName:
        final cartScreenInput = settings.arguments as CartScreenInput;

        return MaterialPageRoute(
            builder: (_) => CartScreen(cartScreenInput: cartScreenInput));

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
