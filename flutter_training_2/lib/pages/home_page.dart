import 'package:flutter/material.dart';
import 'package:flutter_training_2/pages/new_product_page.dart';
import 'package:flutter_training_2/provider/product_provider.dart';
import 'package:flutter_training_2/widgets/product_grid_item.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider provider;
  @override
  void initState() {
    provider = Provider.of(context, listen: false);
    provider.fetchAllProducts();
    super.initState();
  }

  _deleteProduct(int id) {
    provider.removeProduct(id);
  }

  Future<void> _updateProduct(int id, int value){
    provider.updateFavorite(id, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(icon: Icon(Icons.shopping_basket), onPressed: (){
            Navigator.pushNamed(context, CartPage.routeName);
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, NewProductPage.routeName),
        child: Icon(Icons.add),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: provider.productList.map((product) => ProductGridItem(product, _deleteProduct, _updateProduct)).toList(),
        ),
      ),
    );
  }
}
