import 'package:my_app/core/modal/product.dart';

class CartScreenInput {
  CartScreenInput({
    required this.selectedProducts,
    required this.removeFromCart,
    required this.resetCart,
  });

  final List<Product> selectedProducts;
  final void Function(int) removeFromCart;
  final void Function() resetCart;
}
