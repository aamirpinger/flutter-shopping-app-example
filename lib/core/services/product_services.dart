import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/modal/product.dart';

class ProductServices {
  static final ProductServices instance = ProductServices._internal();

  factory ProductServices() {
    return instance;
  }

  ProductServices._internal();

  Future<List<Product>> getProducts(String category) async {
    try {
      String url = Configs.apiBaseURL;
      if (category.isNotEmpty) {
        url += '${Configs.categoryProductsEndpoint}$category';
      } else {
        url += Configs.allProductEndpoint;
      }

      List<dynamic> parsedData = [];
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;

        parsedData = jsonDecode(data);
        if (parsedData == null) {
          throw Exception(ErrorStrings.invalidData);
        }
      }

      List<Product> productList =
          parsedData.map((e) => Product.fromJson(e)).toList();

      return productList;
    } catch (e) {
      debugPrint('${ErrorStrings.somethingWentWrong}: $e');
      rethrow;
    }
  }

  Future<List<String>> getCategories() async {
    try {
      List<dynamic> parsedData = [];
      String url = '${Configs.apiBaseURL}${Configs.categoriesEndpoint}';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;

        parsedData = jsonDecode(data);
        if (parsedData == null) {
          throw Exception(ErrorStrings.invalidData);
        }
      }

      return parsedData.cast<String>();
    } catch (e) {
      debugPrint('${ErrorStrings.somethingWentWrong}: $e');
      rethrow;
    }
  }
}
