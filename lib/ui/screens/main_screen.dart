import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/modal/category.dart';
import 'package:my_app/core/modal/product.dart';
import 'package:my_app/core/providers/category_provider.dart';
import 'package:my_app/core/providers/product_provider.dart';
import 'package:my_app/core/services/product_services.dart';
import 'package:my_app/ui/widgets/billing_tile.dart';
import 'package:my_app/ui/widgets/cart_badge.dart';
import 'package:my_app/ui/widgets/category_tile.dart';
import 'package:my_app/ui/widgets/product_list_view.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  ProductServices productServices = ProductServices();

  int apiCalled = 0;
  int apiCompleted = 0;

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
      ref.read(categoryProvider.notifier).initializeList(response, null);
    }).whenComplete(() => setState(() => apiCompleted++));

    fetchProducts('');

    super.initState();
  }

  void fetchProducts(String category) {
    EasyLoading.show(status: AppStrings.loading);
    apiCalled++;
    productServices.getProducts(category).then((List<Product> response) {
      ref.read(productProvider.notifier).initializeList(response);
      ref.read(categoryProvider.notifier).updateCategory(category);
    }).whenComplete(() => setState(() => apiCompleted++));
  }

  @override
  Widget build(BuildContext context) {
    if (apiCalled == apiCompleted) {
      EasyLoading.dismiss();
    }

    List<String>? categoryList = ref.watch(categoryProvider).categories;
    String? selectedCategory = ref.watch(categoryProvider).selectedCategory;
    List<Product>? productList = ref.watch(productProvider).itemList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appTitle,
        ),
        centerTitle: true,
        actions: [
          CartBadge(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryTile(
            categoryDropDownItemList: categoryList,
            onChange: (value) {
              if (value != null) {
                fetchProducts(value);
              }
            },
            selectedCategory: selectedCategory,
          ),
          SizedBox(
            height: 20,
          ),
          ProductListView(
            itemList: productList,
          ),
          BillingTile()
        ],
      ),
    );
  }
}
