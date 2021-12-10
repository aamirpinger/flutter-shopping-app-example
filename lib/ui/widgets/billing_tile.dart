import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/modal/product.dart';
import 'package:my_app/core/providers/cart_provider.dart';

class BillingTile extends ConsumerWidget {
  double totalBill = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> productList = ref.watch(cartProvider).selectedProducts;
    if (productList.isNotEmpty) {
      totalBill = 0;
      productList.forEach((element) {
        totalBill += element.price;
      });
    }

    return ListTile(
      tileColor: Theme.of(context).colorScheme.secondary,
      leading: Text(
        AppStrings.totalBill,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        totalBill.toStringAsFixed(2),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
