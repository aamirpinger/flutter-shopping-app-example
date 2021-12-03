import 'package:flutter/material.dart';
import 'package:my_app/core/class/product.dart';
import 'package:my_app/ui/widgets/item_tile.dart';
import 'package:my_app/ui/widgets/no_item_tile.dart';

class ProductListView extends StatefulWidget {
  ProductListView({
    this.itemList,
    this.addToCart,
    this.removeFromCart,
    this.removeIcon = false,
  });

  final List<Product>? itemList;
  final void Function(dynamic)? addToCart;
  final void Function(int)? removeFromCart;
  final bool removeIcon;

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final itemListReceived = widget.itemList;

    return itemListReceived == null
        ? Expanded(child: SizedBox())
        : itemListReceived.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: itemListReceived.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemTile(
                      product: itemListReceived[index],
                      onTap: () {
                        setState(
                          () {
                            if (widget.addToCart != null) {
                              widget.addToCart!(itemListReceived[index]);
                            } else if (widget.removeFromCart != null) {
                              widget
                                  .removeFromCart!(itemListReceived[index].id);
                            }
                          },
                        );
                      },
                      removeIcon: widget.removeIcon,
                    );
                  },
                ),
              )
            : NoItemTile();
  }
}
