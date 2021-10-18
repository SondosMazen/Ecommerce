import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_fav_cart_app/ui/cart/providers/database_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  AllProductsResponse product;

  ProductWidget(this.product);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Color _favIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: 15,top: 5),
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        // margin: EdgeInsets.only(left: 10),

        //  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width,
        alignment: AlignmentDirectional.bottomCenter,
        height: 200,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5,right: 15),
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(widget.product.image),
                ),
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 10,)),
                  Row(
                    children: [
                      Text(
                        widget.product.price.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.MAIN_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'SR',
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.MAIN_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      widget.product.title,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.MAIN_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Stack(
                          alignment: Alignment.center,
                          children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 55,
                          width: 160,
                        ),
                        PositionedDirectional(
                          width: 150,
                          height: 45,
                          child: OutlinedButton(
                            onPressed: () {
                              Provider.of<DatabaseProvider>(context,
                                      listen: false)
                                  .insertProductInCart(widget.product);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.MAIN_COLOR),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(

                        onPressed: () {
                          setState(() {
                            if (_favIconColor == Colors.grey) {
                              _favIconColor = Colors.redAccent.shade700;
                            } else {
                              _favIconColor = Colors.grey;
                            }
                          });
                          Provider.of<DatabaseProvider>(context,
                                  listen: false)
                              .insertProductInFavourite(widget.product);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: _favIconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
