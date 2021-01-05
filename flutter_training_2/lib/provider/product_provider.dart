import 'package:flutter/material.dart';
import 'package:flutter_training_2/db/db_helper.dart';
import 'package:flutter_training_2/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get productList => _products;

  void addProduct(Product product) {
    DBSQLiteHelper.insertNewProduct(product).then((_) {
      _products.add(product);
      notifyListeners();
    });
  }

  void fetchAllProducts() {
    DBSQLiteHelper.getAllProducts().then((mapList)  {
          _products = mapList.map((m) => Product.fromMap(m)).toList();
          notifyListeners();
        });
  }

  void removeProduct(int id) {
    DBSQLiteHelper.deleteProduct(id).then((value) {
      _products.removeWhere((product) => product.id == id);
      notifyListeners();
    });
  }

  updateFavorite(int id, int value) {
    DBSQLiteHelper.updateFavorite(id, value).then((_){
      //must be changed
      fetchAllProducts();
    });
  }
}
