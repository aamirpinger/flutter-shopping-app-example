import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/modal/cart_screen_input.dart';
import 'package:my_app/ui/screens/cart_screen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({required this.cartScreenInput});

  final CartScreenInput cartScreenInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            CartScreen.routeName,
            arguments: cartScreenInput,
          );
        },
        child: Badge(
          badgeContent:
              Text(cartScreenInput.selectedProducts.length.toString()),
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
