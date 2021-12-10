import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/modal/product.dart';

class CartState {
  CartState({
    required this.selectedProducts,
  });

  List<Product> selectedProducts;

  CartState copyWith(List<Product> newValue) {
    return CartState(selectedProducts: newValue);
  }
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState(selectedProducts: []));

  void addToCart(Product newProduct) => state = state.copyWith(
        [
          ...state.selectedProducts,
          newProduct,
        ],
      );

  void removeFromCart(Product product) {
    List<Product> filteredProductList = [...state.selectedProducts];
    filteredProductList.removeWhere((element) => element.id == product.id);

    state = state.copyWith(filteredProductList);
  }

  void resetCart() => state = state.copyWith([]);
}
