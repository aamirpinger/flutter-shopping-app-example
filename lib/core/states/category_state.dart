import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/modal/category.dart';
import 'package:my_app/core/modal/product.dart';

class CategoryState {
  CategoryState({
    required this.categories,
    this.selectedCategory,
  });

  List<String> categories;
  String? selectedCategory;

  CategoryState copyWith(List<String>? newValue, String? selectedCategory) {
    return CategoryState(
      categories: newValue ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class CategoryNotifier extends StateNotifier<CategoryState> {
  CategoryNotifier() : super(CategoryState(categories: []));

  void initializeList(List<String> newProductList, String? selectedCategory) =>
      state = state.copyWith(newProductList, selectedCategory);

  void updateCategory(String selectedCategory) =>
      state = state.copyWith(null, selectedCategory);
}
