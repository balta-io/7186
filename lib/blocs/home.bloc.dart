import 'package:eshop/models/category-list-item.model.dart';
import 'package:eshop/models/product-list-item.model.dart';
import 'package:eshop/repositories/category.repository.dart';
import 'package:eshop/repositories/product.repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final categoryService = new CategoryRepository();
  final productService = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryService.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productService.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productService.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}

class Product {}
