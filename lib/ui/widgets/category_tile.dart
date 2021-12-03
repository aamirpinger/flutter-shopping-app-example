import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    required this.categoryDropDownItemList,
    required this.onChange,
    this.selectedCategory = '',
  });

  final List<String> categoryDropDownItemList;
  final String? selectedCategory;
  final void Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.secondary,
      leading: Text(
        AppStrings.categories,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: categoryDropDownItemList.isNotEmpty
          ? DropdownButton(
              isExpanded: true,
              onChanged: onChange,
              value: selectedCategory,
              items: [
                DropdownMenuItem(
                  child: Text(AppStrings.all),
                  value: '',
                ),
                ...categoryDropDownItemList
                    .map(
                      (category) => DropdownMenuItem<String>(
                        child: Text(category),
                        value: category,
                      ),
                    )
                    .toList()
              ],
            )
          : null,
    );
  }
}
