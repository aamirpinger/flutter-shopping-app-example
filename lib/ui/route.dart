import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/cart_screen.dart';
import 'package:my_app/ui/screens/main_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case CartScreen.routeName:
        final args = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (_) => CartScreen(
                  removeFromCart: args['removeFromCart'],
                  selectedProducts: args['selectedProducts'],
                  resetCart: args['resetCart'],
                ));

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
