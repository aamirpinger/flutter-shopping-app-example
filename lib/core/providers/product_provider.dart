import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/states/product_state.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(),
);
