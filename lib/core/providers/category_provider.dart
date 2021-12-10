import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/states/category_state.dart';

final categoryProvider = StateNotifierProvider<CategoryNotifier, CategoryState>(
  (ref) => CategoryNotifier(),
);
