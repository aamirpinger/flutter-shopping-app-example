import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/class/product.dart';
import 'package:my_app/core/services/product_services.dart';
import 'package:my_app/ui/widgets/billing_tile.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/product_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  CartScreen(
      {required this.selectedProducts,
      required this.removeFromCart,
      required this.resetCart});

  final List<Product> selectedProducts;
  final void Function(int) removeFromCart;
  final void Function() resetCart;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductServices productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.checkout,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BillingTile(productList: widget.selectedProducts),
          SizedBox(
            height: 20,
          ),
          ProductListView(
            itemList: widget.selectedProducts,
            removeFromCart: widget.removeFromCart,
            removeIcon: true,
          ),

          CustomButton(
            title: Text(AppStrings.checkout),
            backgroundColor: Theme.of(context).primaryColor,
            isDisabled: widget.selectedProducts.isEmpty,
            onPress: () {
              Alert(
                  context: context,
                  type: AlertType.success,
                  title: AppStrings.checkout,
                  desc: AppStrings.thankyouForShopping,
                  buttons: [
                    DialogButton(
                      child: Text(
                        AppStrings.ok,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ]).show();

              widget.resetCart();
            },
          ),

          // .icon(
          // onPressed: () {},
          // icon: Icon(Icons.payment),
          // label: Text('CHECKOUT'))
        ],
      ),
    );
  }
}
