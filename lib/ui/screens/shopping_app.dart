import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/main_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../route.dart';
import '../theme.dart';

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      initialRoute: MainScreen.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}
