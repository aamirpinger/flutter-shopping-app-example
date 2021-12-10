import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/ui/screens/shopping_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: ShoppingApp(),
    ),
  );
}
