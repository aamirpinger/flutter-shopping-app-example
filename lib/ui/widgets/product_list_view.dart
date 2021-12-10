import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/modal/product.dart';
import 'package:my_app/core/providers/cart_provider.dart';
import 'package:my_app/core/providers/product_provider.dart';
import 'package:my_app/ui/widgets/item_tile.dart';
import 'package:my_app/ui/widgets/no_item_tile.dart';

class ProductListView extends ConsumerWidget {
  ProductListView({required this.itemList, this.removeIcon = false});

  final bool removeIcon;
  final List<Product> itemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListReceived = itemList;

    return itemListReceived.isEmpty
        ? Expanded(child: SizedBox())
        : itemListReceived.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: itemListReceived.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemTile(
                      product: itemListReceived[index],
                      onTap: () {
                        if (!removeIcon) {
                          ref
                              .read(cartProvider.notifier)
                              .addToCart(itemListReceived[index]);
                        } else {
                          ref
                              .read(cartProvider.notifier)
                              .removeFromCart(itemListReceived[index]);
                        }
                      },
                      removeIcon: removeIcon,
                    );
                  },
                ),
              )
            : NoItemTile();
  }
}
