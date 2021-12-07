import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/modal/product.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.product,
    this.removeIcon,
    required this.onTap,
  });

  final Product product;

  final bool? removeIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          horizontalTitleGap: 30,
          leading: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
          title: Text(product.title),
          subtitle: Text('${product.category} @ ${product.price}'),
          trailing: GestureDetector(
            onTap: onTap,
            child: Icon(
              removeIcon == true
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
