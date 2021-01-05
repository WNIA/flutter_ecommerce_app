import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final String  TABLE_PRODUCT = 'TBL_PRODUCT';
final String  COL_PRODUCT_ID = 'PRODUCT_ID';
final String  COL_PRODUCT_NAME = 'PRODUCT_NAME';
final String  COL_PRODUCT_CATEGORY = 'PRODUCT_CATEGORY';
final String  COL_PRODUCT_DESCRIPTION = 'PRODUCT_DESCRIPTION';
final String  COL_PRODUCT_PRICE = 'PRODUCT_PRICE';
final String  COL_PRODUCT_FAV = 'PRODUCT_FAV';
final String  COL_PRODUCT_FORMATTED_DATE = 'PRODUCT_FORMATTED_DATE';
final String  COL_PRODUCT_MONTH = 'PRODUCT_MONTH';
final String  COL_PRODUCT_YEAR = 'PRODUCT_YEAR';
final String  COL_PRODUCT_TIMESTAMP = 'PRODUCT_TIMESTAMP';
final String  COL_PRODUCT_RATING = 'PRODUCT_RATING';
final String  COL_PRODUCT_IMAGE = 'PRODUCT_IMAGE';

class Product {
  int id;
  String name;
  String category;
  String description;
  double price;
  bool isFavorite;
  String formattedDate;
  int uploadedMonth;
  int uploadedYear;
  int timeStamp;
  double rating;
  String image;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
    COL_PRODUCT_NAME: name,
    COL_PRODUCT_CATEGORY: category,
    COL_PRODUCT_DESCRIPTION: description,
    COL_PRODUCT_PRICE: price,
    COL_PRODUCT_FAV: isFavorite ? 1 : 0,
    COL_PRODUCT_FORMATTED_DATE: formattedDate,
    COL_PRODUCT_MONTH: uploadedMonth,
    COL_PRODUCT_YEAR: uploadedYear,
    COL_PRODUCT_TIMESTAMP: timeStamp,
    COL_PRODUCT_RATING: rating,
    COL_PRODUCT_IMAGE: image

    };
    if(id != null) {
      map[COL_PRODUCT_ID] = id;
    }
    return map;
  }

  Product.fromMap(Map<String, dynamic> map){
    id = map[COL_PRODUCT_ID];
    name = map[COL_PRODUCT_NAME];
    category = map[COL_PRODUCT_CATEGORY];
    description = map[COL_PRODUCT_DESCRIPTION];
    price = map[COL_PRODUCT_PRICE];
    isFavorite = map[COL_PRODUCT_FAV] == 1 ? true : false;
    formattedDate = map[COL_PRODUCT_FORMATTED_DATE];
    uploadedMonth = map[COL_PRODUCT_MONTH];
    uploadedYear = map[COL_PRODUCT_YEAR];
    timeStamp = map[COL_PRODUCT_TIMESTAMP];
    rating = map[COL_PRODUCT_RATING];
    image = map[COL_PRODUCT_IMAGE];
  }

  Product(
      {this.id,
      @required this.name,
      @required this.category,
      this.description,
      @required this.price,
      this.isFavorite = false,
      this.formattedDate,
      this.uploadedMonth,
      this.uploadedYear,
      this.timeStamp,
      this.rating = 0.0,
      this.image});

  @override
  String toString() {
    return 'Product{id: $id, name: $name, category: $category, description: $description, price: $price, isFavorite: $isFavorite, formattedDate: $formattedDate, uploadedMonth: $uploadedMonth, uploadedYear: $uploadedYear, timeStamp: $timeStamp, rating: $rating, image: $image}';
  }
}
