import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_training_2/models/product_model.dart';
import 'package:flutter_training_2/provider/product_provider.dart';
import 'package:flutter_training_2/utils/product_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  static final routeName = "/new_product";

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _formKey = GlobalKey<FormState>();
  var product = Product();
  DateTime _selectedDate;
  String _imagePath;
  String category = null;
  bool fromCamera = true;

  _saveProducts() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_selectedDate == null) return;
      if (_imagePath == null) return;
      if(category == null) return;
      Provider
      .of<ProductProvider>(context, listen: false)
      .addProduct(product);
      Navigator.pop(context);
      print(product);
    }
  }

  _openCalendar() {
    var dt = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2022),
    ).then((dateTime) {
      setState(() {
        _selectedDate = dateTime;
      });
      product.formattedDate = DateFormat('dd/MM/yyy').format(_selectedDate);
      product.timeStamp = _selectedDate.millisecondsSinceEpoch;
      product.uploadedMonth = _selectedDate.month;
      product.uploadedYear = _selectedDate.year;
    });
  }

  _takePhoto() {
    ImagePicker()
        .getImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery)
        .then((pickedFile) {
      setState(() {
        _imagePath = pickedFile.path;
        print(_imagePath);
      });
      product.image = _imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Enter Product Name',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Cannot be Empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  product.name = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Enter Product Description',
                    border: OutlineInputBorder()),
                validator: (value) {
                  return null;
                },
                onSaved: (value) {
                  product.description = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Enter Product Price',
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Cannot be Empty';
                  }
                  if (double.parse(value) <= 0.0) {
                    return 'Provide a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  product.price = double.parse(value);
                },
              ),
              SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    Text('Select Category'),
                    DropdownButton(
                        value: category,
                        items: categoryList
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            category = value;
                          });
                          product.category = category;
                        })
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text('Select Purchase Date'),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_selectedDate == null
                          ? 'No date chosen'
                          : '${product.formattedDate}'),
                      FlatButton(
                          onPressed: _openCalendar, child: Text('Select Date'))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Select Product Image'),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 4,
                        child: _imagePath == null
                            ? Image.asset('images/placeholder.PNG')
                            : Image.file(File(_imagePath)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                setState(() {
                                  fromCamera = true;
                                });
                                _takePhoto();
                              },
                              textColor: Colors.white,
                              child: Text('Capture Image'),
                              color: Theme.of(context).primaryColor),
                          RaisedButton(
                              onPressed: () {
                                setState(() {
                                  fromCamera = false;
                                });
                                _takePhoto();
                              },
                              textColor: Colors.white,
                              child: Text('Select From Galary'),
                              color: Theme.of(context).primaryColor)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Save'),
                  onPressed: _saveProducts,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
