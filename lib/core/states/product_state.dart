import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/modal/product.dart';

class ProductState {
  ProductState({
    required this.itemList,
  });

  List<Product> itemList;

  ProductState copyWith(List<Product> newValue) {
    return ProductState(itemList: newValue);
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState(itemList: []));

  void initializeList(List<Product> newProductList) =>
      state = state.copyWith(newProductList);
}
