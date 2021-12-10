import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/modal/product.dart';
import 'package:my_app/core/providers/cart_provider.dart';
import 'package:my_app/core/services/product_services.dart';
import 'package:my_app/ui/screens/main_screen.dart';
import 'package:my_app/ui/widgets/billing_tile.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/product_list_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartScreen extends ConsumerWidget {
  static const String routeName = '/cart';
  ProductServices productServices = ProductServices();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> selectedProducts =
        ref.watch(cartProvider).selectedProducts;

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
          BillingTile(),
          SizedBox(
            height: 20,
          ),
          ProductListView(
            itemList: selectedProducts,
            removeIcon: true,
          ),
          selectedProducts.isNotEmpty
              ? CustomButton(
                  title: Text(AppStrings.checkout),
                  backgroundColor: Theme.of(context).primaryColor,
                  isDisabled: selectedProducts.isEmpty,
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
                              ref.watch(cartProvider.notifier).resetCart();
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
