import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_training_2/models/product_model.dart';
import 'package:flutter_training_2/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatefulWidget {
  final Product product;
  final Function deleteCallBack;
  final Future<void> Function(int id, int value) updateFavCallBack;

  @override
  _ProductGridItemState createState() => _ProductGridItemState();

  ProductGridItem(this.product, this.deleteCallBack, this.updateFavCallBack);
}

class _ProductGridItemState extends State<ProductGridItem> {

  bool isVisible = false;
  double topPosOfContainer = -100;
  double containerOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
          topPosOfContainer = isVisible ? 0 : -100;
          containerOpacity = isVisible ? 1.0 : 0.0;
        });
      },
      child: LayoutBuilder(
        builder: (context, constraint) => Card(
          elevation: 5,
          color: Colors.amber,
          child: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                      flex: 7,
                      child: Image.file(
                        File(widget.product.image),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                  Spacer(),
                  Flexible(
                      child: Text(widget.product.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  Flexible(
                      child: Text('${widget.product.price} Tk',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  Spacer()
                ],
              ),
              AnimatedPositioned(
                //implicit animation
                duration: const Duration(milliseconds: 300),
                top: topPosOfContainer,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: containerOpacity,
                  child: Container(
                    width: constraint.maxWidth,
                    color: Colors.black.withOpacity(0.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Text('Details'),
                          textColor: Colors.white,
                        ),
                        Divider(color: Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Consumer<CartProvider>(
                              builder: (context, provider, child) => IconButton(
                                  icon: Icon(Icons.shopping_cart_sharp,
                                      color: Colors.white),
                                  onPressed: () {
                                    provider.addToCart(widget.product);
                                  }),
                            ),
                            IconButton(
                                icon: Icon(Icons.favorite, color: widget.product.isFavorite ? Colors.red : Colors.white),
                                onPressed: () {
                                  final value = widget.product.isFavorite ? 0 : 1;
                                  await widget.updateFavCallBack(widget.product.id, value);
                                  
                                    setState(() {
                                      widget.product.isFavorite = !widget.product.isFavorite;
                                    });

                                }),
                            IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                'Delete ${widget.product.name}?'),
                                            content: Text(
                                                'Are sure to delete this item?'),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text('Cancel')),
                                              RaisedButton(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                textColor: Colors.white,
                                                child: Text('Delete'),
                                                onPressed: () {
                                                  widget.deleteCallBack(widget.product.id);
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ));
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
