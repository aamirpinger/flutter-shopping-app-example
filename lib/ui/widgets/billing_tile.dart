import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/modal/product.dart';

class BillingTile extends StatelessWidget {
  BillingTile({
    required this.productList,
  });

  final List<Product> productList;
  double totalBill = 0;

  @override
  Widget build(BuildContext context) {
    if (productList.isNotEmpty) {
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
