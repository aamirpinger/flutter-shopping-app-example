import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/states/cart_state.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, CartState>((ref) => CartNotifier());
