import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/class/product.dart';
import 'package:my_app/ui/screens/cart_screen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    required this.selectedProducts,
    required this.removeFromCart,
    required this.resetCart,
  });

  final List<Product> selectedProducts;
  final void Function(int) removeFromCart;
  final void Function() resetCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CartScreen.routeName, arguments: {
            "removeFromCart": removeFromCart,
            "selectedProducts": selectedProducts,
            "resetCart": resetCart,
          });
        },
        child: Badge(
          badgeContent: Text(selectedProducts.length.toString()),
          position: BadgePosition.topEnd(top: 3, end: -20),
          child: Icon(
            Icons.shopping_cart,
            size: 24,
          ),
        ),
      ),
    );
  }
}
