import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/class/product.dart';
import 'package:my_app/core/services/product_services.dart';
import 'package:my_app/ui/widgets/billing_tile.dart';
import 'package:my_app/ui/widgets/cart_badge.dart';
import 'package:my_app/ui/widgets/category_tile.dart';
import 'package:my_app/ui/widgets/product_list_view.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ProductServices productServices = ProductServices();

  int apiCalled = 0;
  int apiCompleted = 0;
  List<String> categoryList = [];
  List<Product>? itemList;
  List<Product> selectedItemList = [];
  String selectedCategory = '';

  @override
  void initState() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.white
      ..indicatorColor = Colors.teal.shade900
      ..backgroundColor = Colors.white
      ..textColor = Colors.teal.shade900
      ..maskColor = Colors.teal.shade900.withOpacity(0)
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show(status: AppStrings.loading);
    apiCalled++;
    productServices.getCategories().then((response) {
      setState(() {
        categoryList = response as List<String>;
      });
    }).whenComplete(() => setState(() => apiCompleted++));

    fetchProducts('');

    super.initState();
  }

  void fetchProducts(String category) {
    EasyLoading.show(status: AppStrings.loading);
    apiCalled++;
    productServices.getProducts(category).then((List<Product> response) {
      setState(() {
        itemList = response;
      });
    }).whenComplete(() => setState(() => apiCompleted++));
  }

  void addToCart(dynamic rawProductRecord) {
    setState(() {
      selectedItemList.add(rawProductRecord);
    });
  }

  void removeFromCart(int id) {
    setState(() => selectedItemList.removeWhere((element) => element.id == id));
  }

  void resetCart() {
    setState(() {
      selectedItemList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedItemList.length);
    if (apiCalled == apiCompleted) {
      EasyLoading.dismiss();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appTitle,
        ),
        centerTitle: true,
        actions: [
          CartBadge(
            selectedProducts: selectedItemList,
            removeFromCart: removeFromCart,
            resetCart: resetCart,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryTile(
            categoryDropDownItemList: categoryList,
            onChange: (value) {
              if (value != null) {
                setState(() => selectedCategory = value);
                fetchProducts(value);
              }
            },
            selectedCategory: selectedCategory,
          ),
          SizedBox(
            height: 20,
          ),
          ProductListView(
            itemList: itemList,
            addToCart: addToCart,
          ),
          BillingTile(productList: selectedItemList)
        ],
      ),
    );
  }
}
