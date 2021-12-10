class Category {
  final List<String> categoryList;

  Category({
    required this.categoryList,
  });

  factory Category.fromList(List<String> categoryList) {
    return Category(
      categoryList: categoryList,
    );
  }
}
