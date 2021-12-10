import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/modal/product.dart';
import 'package:my_app/core/providers/cart_provider.dart';
import 'package:my_app/ui/screens/cart_screen.dart';

class CartBadge extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> selectedProducts =
        ref.watch(cartProvider).selectedProducts;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            CartScreen.routeName,
          );
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
