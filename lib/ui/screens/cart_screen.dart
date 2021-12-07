import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/product_services.dart';
import 'package:my_app/ui/screens/main_screen.dart';
import 'package:my_app/ui/widgets/billing_tile.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/product_list_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  CartScreen({required this.cartScreenInput});

  final cartScreenInput;

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
          BillingTile(productList: widget.cartScreenInput.selectedProducts),
          SizedBox(
            height: 20,
          ),
          ProductListView(
            itemList: widget.cartScreenInput.selectedProducts,
            removeFromCart: (id) {
              setState(() {
                widget.cartScreenInput.removeFromCart(id);
              });
            },
            removeIcon: true,
          ),
          widget.cartScreenInput.selectedProducts.isNotEmpty
              ? CustomButton(
                  title: Text(AppStrings.checkout),
                  backgroundColor: Theme.of(context).primaryColor,
                  isDisabled: widget.cartScreenInput.selectedProducts.isEmpty,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              widget.cartScreenInput.resetCart();
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainScreen.routeName,
                                  (Route<dynamic> route) => false);
                            },
                            width: 120,
                          )
                        ]).show();
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
